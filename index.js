/* IMPORTING LIBRARIES: */
require('dotenv').config(); /* FOR USING .env AS CONFIG */
const {GatewayIntentBits, Client, Collection, MessageMentions} = require("discord.js"); /* FOR USING discord.js */
const {readdirSync} = require("node:fs"); /* FOR READING DIRECTORIES */

/* LOCALES FUNCTIONS: */
const locales = {};
readdirSync('./locales').forEach(file => {
    const localeCode = file.replace(/\.json$/, '');
    const localePath = `./locales/${file}`;
    locales[localeCode] = require(localePath);
});

function getLocale(locale, string, replacements = {}) {
    return locales[locale][string].replace(/{{\s*(\w+)\s*}}/g, (match, variable) => {
        return replacements[variable] || match;
    });
}

/* DISCORD FUNCTIONS: */
const bot = new Client({
    intents: [
        GatewayIntentBits.DirectMessageReactions,
        GatewayIntentBits.GuildBans,
        GatewayIntentBits.GuildInvites,
        GatewayIntentBits.GuildMessageTyping,
        GatewayIntentBits.GuildScheduledEvents,
        GatewayIntentBits.Guilds,
        GatewayIntentBits.DirectMessageTyping,
        GatewayIntentBits.GuildEmojisAndStickers,
        GatewayIntentBits.GuildMembers,
        GatewayIntentBits.GuildMessages,
        GatewayIntentBits.GuildVoiceStates,
        GatewayIntentBits.MessageContent,
        GatewayIntentBits.DirectMessages,
        GatewayIntentBits.GuildIntegrations,
        GatewayIntentBits.GuildMessageReactions,
        GatewayIntentBits.GuildPresences,
        GatewayIntentBits.GuildWebhooks,
    ],
    allowedMentions: {
        parse: [
            'users',
            'roles',
            'everyone',
        ],
        repliedUser: true
    },
    partials: [
        'MESSAGE',
        'CHANNEL',
        'REACTION',
        'USER',
        'GUILD_MEMBER'
    ]
});

bot.commands = new Collection();

bot.login(Number(process.env.STATUS) === 0 ? process.env.DISCORD_TOKEN_DEV : process.env.DISCORD_TOKEN_RELEASE);

readdirSync('./handlers').forEach(file => {
    require(`./handlers/${file}`)(bot);
});

/* EXPORTING FUNCTIONS: */
module.exports = {getLocale};
