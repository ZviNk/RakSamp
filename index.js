require('dotenv').config();
const { spawn } = require('child_process');
const { db } = require("./db");
const { readdirSync, unlinkSync, existsSync, mkdirSync } = require("fs");
const { join, resolve } = require("path");

main();
setInterval(checkTasks, 5000);
setInterval(checkLogs, 60 * 60 * 1000);

async function main() {
    const servers = await db(`SELECT * FROM \`arizona\`.servers_raksamp WHERE \`active\` = true AND \`start\` = true;`);

    for (const server of servers) {
        await createLogs(server.server_id);
        startServer(server);
    }
}

function startServer(server) {
    console.log(`Executing: wine raksamp/arizona.exe -project 1 -server ${server.server_id}`);

    const process = spawn("wine", ["raksamp/arizona.exe", "-project", "1", "-server", server.server_id]);

    process.stdout.on("data", (data) => {
        console.log(`[STDOUT] ${data}`);
    });

    process.stderr.on("data", (data) => {
        console.error(`[STDERR] ${data}`);
    });

    process.on("close", (code) => {
        console.log(`[ RakSamp ] Server ${server.server_id} exited with code ${code}`);
    });

    process.on("error", (err) => {
        console.error("Failed to start process:", err);
    });
}

async function checkTasks() {
    const tasks = await db(`SELECT * FROM \`arizona\`.tasks_system WHERE \`passed\` = false;`);

    for (const task of tasks) {
        const data = await db(`SELECT * FROM \`arizona\`.servers_raksamp WHERE \`server_id\` = ${task.server_id};`);
        const server = data[0];
        const time_created = new Date(task.time_created + ' UTC');

        if (!server.active) {
            await db(`UPDATE \`arizona\`.tasks_system SET \`error\` = true, \`text_error\` = "Система отключена на данном сервере." WHERE \`server_id\` = ${task.server_id};`);
            continue;
        }

        switch (task.task) {
            case 'restart':
                if (new Date() - time_created >= 10000) {
                    await db(`UPDATE \`arizona\`.tasks_system SET \`error\` = true, \`text_error\` = "Сервер выключен.", \`passed\` = true WHERE \`server_id\` = ${server.server_id};`);
                    break;
                }
                startServer(server);
                break;
            case 'start':
                if (!server.started) {
                    await db(`UPDATE \`arizona\`.servers_raksamp SET \`start\` = true WHERE \`server_id\` = ${server.server_id};`);
                    startServer(server);
                }
                break;
            case 'stop':
                console.log(`[ RakSamp ] Stopping ${server.server_name} [IP: ${server.server_ip} | PORT: ${server.server_port}].`);
                break;
            default:
                break;
        }
    }
}

async function checkLogs() {
    const sixMonthsAgo = new Date();
    sixMonthsAgo.setMonth(sixMonthsAgo.getMonth() - 6);
    const servers = readdirSync("./logs");

    for (const server of servers) {
        const serverLogsDir = join("./logs", server);
        const logs = readdirSync(serverLogsDir);

        for (const log of logs) {
            const logPath = join(serverLogsDir, log);

            const match = log.match(/^\d{2}\.\d{2}\.\d{4}\.log$/);
            if (match) {
                const [day, month, year] = log.split(".").map(Number);
                const logDate = new Date(year, month - 1, day);

                if (logDate < sixMonthsAgo) {
                    unlinkSync(logPath);
                    console.log(`[ Logs ] Deleted "${log}" from server №${server}.`);
                }
            }
        }
    }
}

async function createLogs(id) {
    const logsPath = resolve(`${process.env.PATH_MAIN}/logs/${id}`);

    if (!existsSync(logsPath)) {
        mkdirSync(logsPath, { recursive: true });
        console.log(`[ Logs ] Created server №${id} logs directory.`);
    }
}
