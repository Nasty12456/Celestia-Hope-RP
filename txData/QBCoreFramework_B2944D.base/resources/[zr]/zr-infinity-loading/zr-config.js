const backgrounds = [
    'zr-assets/img/background.webp', //the default one should be named as background
    'zr-assets/img/background2.webp', //the rest don't matter
]

const backgroundRandomStart = false
const backgroundInterval = 5  // in seconds

const logo = {
    title: 'Celestial Hope RP',
    subtitle: 'Welcome To'
}

let backgroundPlayer = true; // if you want to use a video in the background

const notifications = [
    {
        title: 'Use /me commands for immersive character actions and reactions:',
        message: "Utilize the /me command to describe your character's actions in a way that enhances the role-playing experience. For example, '/me takes a deep breath, preparing for the impending challenge."
    },
    {
        title: 'Character Development:',
        message: "Invest time in crafting a comprehensive backstory and personality for your character to add depth and complexity to your roleplaying experience."
    },
    {
        title: 'Use /me commands for immersive character actions and reactions:',
        message: "Utilize the /me command to describe your character's actions in a way that enhances the role-playing experience. For example, '/me takes a deep breath, preparing for the impending challenge."
    },
    {
        title: 'Engage in IC Conversations:',
        message: "Actively participate in in-character conversations with other players to immerse yourself in the roleplay world and build connections with different characters."
    }
]

const topSliderImages = [
    '/zr-assets/top-slider/slide1.webp',
    '/zr-assets/top-slider/slide2.webp',
    '/zr-assets/top-slider/slide3.webp'
];

const trans = {
    tabs: {
        news: 'News',
        rules: 'Rules',
        patch: 'Patch Notes',
        team: 'Team',
    },
    social: {
        text: 'Follow the city on social'
    },
    loading: {
        text: 'Please wait. The city is loading...'
    }
}



const newsArticles = [
    { 
        title: "🌟 Exciting News, Celestia Hope RP Community! 🌟", 
        description: "We are thrilled to announce that our Tebex Store is now LIVE! 🎉  Whether you’re looking to enhance your in-game experience or support the growth of our city, our Tebex store has something for everyone. Head over to the store and check out our awesome offerings, from custom vehicles to exclusive perks and more! 🚗✨",
        rewardTitle: 'April 12th',
        rewardValue: '6:00 PM',
        image: "/zr-assets/news/slide1.webp"
    },
    { 
        title: "Parkour Update in Celestia Hope RP! 🏙️", 
        description: "Get ready to level up your movement in the city! 🚀 We’re excited to announce that Parkour has officially been added to Celestia Hope RP! Now you can jump, vault, and scale obstacles with style as you navigate through the streets like never before. 🧗‍♂️✨ This new feature brings a whole new dynamic to exploration, chases, and city life. Whether you're escaping a sticky situation or just showing off your skills, the city is your playground! Hop in and try it out now!",
        rewardTitle: 'March 25th',
        rewardValue: '9:00 PM',
        image: "/zr-assets/news/slide2.png"
    },
    { 
        title: "🚴‍♂️ BMX Tricks Update in Celestia Hope RP! 🛹", 
        description: "Attention all adrenaline junkies! The BMX Tricks update is now live in Celestia Hope RP! 🎉 Time to grab your bike and hit the streets, parks, and ramps to show off your best flips, spins, and insane stunts! 🌀💥  From casual riding to pulling off high-flying tricks, the city has become your personal skatepark. Whether you're racing through the streets or just impressing your friends, this update brings a whole new level of fun and creativity! Jump in and start riding today!",
        rewardTitle: 'April 4th',
        rewardValue: '8:00 AM',
        image: "/zr-assets/news/slide3.png"
    },
    { 
        title: "🌵 Sandy Shores Remake Update in Celestia Hope RP! 🏜️", 
        description: "Big changes have come to Sandy Shores! The iconic area has been completely remade with fresh landscapes, new buildings, and revamped hotspots to explore. Whether you’re a local or just passing through, you'll be amazed by the transformation! 🏘️✨  From updated infrastructure to brand-new locations, the spirit of Sandy Shores remains but with a modern twist. It’s the perfect time to revisit this beloved part of the map and discover all the new possibilities! Come see the changes for yourself in Celestia Hope RP!",
        rewardTitle: 'In',
        rewardValue: 'Sandy Shores',
        image: "/zr-assets/news/slide4.webp"
    }
]


const options = {
    home: {
        icon: '/zr-assets/options/zr-icon-home.svg',
        text: 'Home'
    },
    youtube: {
        icon: '/zr-assets/options/zr-icon-player.svg',
        text: 'Youtube'
    },
    keyboard: {
        icon: '/zr-assets/options/zr-icon-keyboard.svg',
        text: 'Keyboard'
    },
    commands: {
        icon: '/zr-assets/options/zr-icon-commands.svg',
        text: 'Commands'
    },

}



const keyboard = {
    layout: [
        {"code": 27, "label": "Esc", "class": "key inkey"},
        {"code": 112, "label": "F1", "class": "key inkey active"}, // add active
        {"code": 113, "label": "F2", "class": "key inkey"},
        {"code": 114, "label": "F3", "class": "key inkey"},
        {"code": 115, "label": "F4", "class": "key inkey"},
        {"code": 116, "label": "F5", "class": "key inkey"},
        {"code": 117, "label": "F6", "class": "key inkey"},
        {"code": 118, "label": "F7", "class": "key inkey"},
        {"code": 119, "label": "F8", "class": "key inkey"},
        {"code": 120, "label": "F9", "class": "key inkey"},
        {"code": 121, "label": "F10", "class": "key inkey"},
        {"code": 122, "label": "F11", "class": "key inkey"},
        {"code": 123, "label": "F12", "class": "key inkey"},
        {"code": 8, "label": "Delete", "class": "key delete"},
        {"code": 192, "label": "~", "class": "key inkey"},
        {"code": 49, "label": "1", "class": "key inkey"},
        {"code": 50, "label": "2", "class": "key inkey"},
        {"code": 51, "label": "3", "class": "key inkey"},
        {"code": 52, "label": "4", "class": "key inkey"},
        {"code": 53, "label": "5", "class": "key inkey"},
        {"code": 54, "label": "6", "class": "key inkey"},
        {"code": 55, "label": "7", "class": "key inkey"},
        {"code": 56, "label": "8", "class": "key inkey"},
        {"code": 57, "label": "9", "class": "key inkey"},
        {"code": 48, "label": "0", "class": "key inkey"},
        {"code": 189, "label": "-", "class": "key inkey"},
        {"code": 187, "label": "+", "class": "key inkey"},
        {"code": 8, "label": "Backspace", "class": "key delete"},
        {"code": 9, "label": "Tab", "class": "key tab active"},
        {"code": 81, "label": "Q", "class": "key inkey"},
        {"code": 87, "label": "W", "class": "key inkey"},
        {"code": 69, "label": "E", "class": "key inkey"},
        {"code": 82, "label": "R", "class": "key inkey"},
        {"code": 84, "label": "T", "class": "key inkey active"},
        {"code": 89, "label": "Y", "class": "key inkey"},
        {"code": 85, "label": "U", "class": "key inkey"},
        {"code": 73, "label": "I", "class": "key inkey"},
        {"code": 79, "label": "O", "class": "key inkey"},
        {"code": 80, "label": "P", "class": "key inkey"},
        {"code": 219, "label": "[", "class": "key inkey"},
        {"code": 221, "label": "]", "class": "key inkey"},
        {"code": 220, "label": "\\", "class": "key inkey backslash"},
        {"code": 20, "label": "CapsLock", "class": "key capslock"},
        {"code": 65, "label": "A", "class": "key inkey"},
        {"code": 83, "label": "S", "class": "key inkey"},
        {"code": 68, "label": "D", "class": "key inkey"},
        {"code": 70, "label": "F", "class": "key inkey"},
        {"code": 71, "label": "G", "class": "key inkey active"},
        {"code": 72, "label": "H", "class": "key inkey active"},
        {"code": 74, "label": "J", "class": "key inkey"},
        {"code": 75, "label": "K", "class": "key inkey"},
        {"code": 76, "label": "L", "class": "key inkey active"},
        {"code": 186, "label": ";", "class": "key inkey"},
        {"code": 222, "label": "'", "class": "key inkey"},
        {"code": 13, "label": "Enter", "class": "key return"},
        {"code": 16, "label": "Shift", "class": "key leftshift"},
        {"code": 90, "label": "Z", "class": "key inkey"},
        {"code": 88, "label": "X", "class": "key inkey"},
        {"code": 67, "label": "C", "class": "key inkey"},
        {"code": 86, "label": "V", "class": "key inkey"},
        {"code": 66, "label": "B", "class": "key inkey active"},
        {"code": 78, "label": "N", "class": "key inkey"},
        {"code": 77, "label": "M", "class": "key inkey active"},
        {"code": 188, "label": ",", "class": "key inkey"},
        {"code": 190, "label": ".", "class": "key inkey"},
        {"code": 191, "label": "/", "class": "key inkey"},
        {"code": 16, "label": "Shift", "class": "key rightshift"},
        {"code": 17, "label": "Ctrl", "class": "key leftctrl"},
        {"code": 18, "label": "Alt", "class": "key"},
        {"code": 90, "label": "Command", "class": "key command"},
        {"code": 32, "label": "Space", "class": "key inkey space"},
        {"code": 90, "label": "Command", "class": "key command"},
        {"code": 18, "label": "Alt", "class": "key"},
        {"code": 17, "label": "Ctrl", "class": "key"},
        {"code": 0, "label": "Fn", "class": "key"}
    ],     
    key: {
        title: 'Select a highlighted key to Understand its assigned function.'
    },
    selectedKeys: {
        112: 'F1 - Opens the Interaction Menu, offering quick access to various in-game features, settings, and actions for an enhanced gaming experience.',
        9: 'TAB - Opens Inventory, allowing you to manage your characters items and equipment.',
        71: 'G - Toggles the vehicle engine, starting or stopping it.',
        66: 'B - Toggles the seat belt, fastening or unfastening it for safety while driving.',
        76: 'L - Toggles vehicle locks, preventing or allowing unauthorized access.',
        72: 'H - Toggles the vehicle headlights on or off for visibility at night.',
        77: 'M - Opens the map, providing an overview of the game world and points of interest.',
        84: 'T - Opens the chat, you can use different commands.',
    }
}

const commands = {
    title: 'Commands',
    subtitle: 'A list of all the commands and their respective resource',
    options: [
        {
            id: 1,
            label: 'Ambulance Jobs',
            commands: [
                {
                    code: '/911e [message]',
                    description: 'Sends a message to EMS.'
                },
                {
                    code: '/heal',
                    description: ' Heals the nearest player.'
                },
                {
                    code: '/status',
                    description: 'Check the status of the nearest player.'
                },
                {
                    code: '/revivep',
                    description: 'Revives the nearest player'
                },
                {
                    code: '/revive',
                    description: 'Revive yourself'
                },
                {
                    code: '/kill [opt: id]',
                    description: 'Kills the player'
                },
                {
                    code: '/aheal',
                    description: ' Heals a player'
                },
            ]
        },
        {
            id: 2,
            label: 'Mechanic Job',
            commands: [
                {
                    code: '/setvehiclestatus',
                    description: 'Sets the vehicles status'
                },
                {
                    code: '/setmechanic',
                    description: 'Give someone the mechanic job'
                },
                {
                    code: '/firemechanic',
                    description: 'Fire a mechanic'
                },
            ]
        },
        {
            id: 3,
            label: 'Police Job',
            commands: [
                {
                    code: '/911p [message]',
                    description: 'sends an alert to the police'
                },
                {
                    code: '/spikestrip',
                    description: 'Place a spike strip'
                },
                {
                    code: '/grantlicense [id] [license]',
                    description: 'give a player a license'
                },
                {
                    code: '/revokelicense [id] [license]',
                    description: 'remove a player license'
                },
                {
                    code: '/cuff',
                    description: 'cuff the nearest player'
                },
                {
                    code: '/escort',
                    description: 'escort the nearest player'
                },
                {
                    code: '/jail',
                    description: 'sends nearest player to jail'
                },
                {
                    code: '/unjail [id]',
                    description: 'unjail a player'
                },
                {
                    code: '/clearcasings',
                    description: 'clears bullet casings in the area'
                },
                {
                    code: '/flagplate [plate] [reason]',
                    description: 'allows speed cameras to find a plate flagged'
                },
                {
                    code: '/unflagplate [plate]',
                    description: 'removes the flag from the plate'
                },
                {
                    code: '/anklet',
                    description: 'adds a tracking device to the closest player'
                },
                {
                    code: '/ankletlocation [cid]',
                    description: 'shows the location of the player'
                },
                {
                    code: '/takedrivinglicense',
                    description: 'takes the players drivers license'
                },
                {
                    code: '/takedna [id]',
                    description: 'takes the players dna'
                },
                {
                    code: '/impound',
                    description: 'impounds a vehicle without a price'
                },
                {
                    code: '/depot [price]',
                    description: 'allows officer to impound vehicle for a price'
                },
                {
                    code: '/clearblood',
                    description: 'clears blood drops in the area'
                },
                {
                    code: '/pobject [type]',
                    description: 'allows officer to spawn an object'
                },
                {
                    code: '/clearcasings',
                    description: 'clears bullet casings in the area'
                },
            ]
        },
        {
            id: 4,
            label: 'Hud',
            commands: [
                {
                    code: '/cash',
                    description: 'displays current cash amount'
                },
                {
                    code: '/bank',
                    description: 'displays current bank amount'
                },
            ]
        },
        {
            id: 5,
            label: 'Inventory',
            commands: [
                {
                    code: '/rob',
                    description: 'robs closest player'
                },
                {
                    code: '/giveitem',
                    description: 'gives item to a player'
                },
                {
                    code: '/randomitems',
                    description: 'gives random items to a player'
                },
            ]
        }
    ]
}


const links = {
    discord: {
        icon: '/zr-assets/links/zr-icon-discord.svg',
        link: 'https://discord.gg/CanKkZQB4B'
    },
    link: {
        icon: '/zr-assets/links/zr-icon-link.svg',
        link: 'https://celestia-hope-rp.tebex.io/'
    },
    youtube: {
        icon: '/zr-assets/links/zr-icon-youtube.svg',
        link: 'https://www.youtube.com/channel/UCW6MWCjkXBNZeNjeYCNEpbA'
    },
    instagram: {
        icon: '/zr-assets/links/zr-icon-instagram.svg',
        link: 'https://www.youtube.com/channel/UCW6MWCjkXBNZeNjeYCNEpbA'
    },
    x: {
        icon: '/zr-assets/links/zr-icon-x.svg',
        link: 'https://www.youtube.com/channel/UCW6MWCjkXBNZeNjeYCNEpbA'
    }
}

const rules = {
    title: 'Roleplay Rules',
    content: [
        {
            title: 'Respect',
            list: [
                'Treat others with courtesy.',
                'Avoid offensive content.',
                'Obtain consent for major plot points.'
            ]
        },
        {
            title: 'Consistency',
            list: [
                'Maintain character coherence.'
            ]
        },
        {
            title: 'Collaboration',
            list: [
                'Collaborate with others to create engaging stories.'
            ]
        },
        {
            title: 'GM Authority',
            list: [
                'Respect Game Master authority and decisions.'
            ]
        },
        {
            title: 'Communication',
            list: [
                'Use clear and respectful communication.',
                'Resolve conflicts through open dialogue.'
            ]
        },
        {
            title: 'Character Development',
            list: [
                'Develop your character over time.',
                'Ensure your character actions align with their background.'
            ]
        },
        {
            title: 'Roleplay Etiquette',
            list: [
                'Avoid metagaming (using out-of-character knowledge in-character).',
                'Separate in-character and out-of-character actions and information.'
            ]
        },
        {
            title: 'Creativity',
            list: [
                'Encourage creative and immersive roleplay.',
                'Explore diverse storylines and character interactions.'
            ]
        }
    ]
}

const patchNotes = {
    title: 'Patch Notes',
    content: [
        {
            title: '/',
            list: [
                {
                    text: '/',
                    sublist: [
                        '/',
                        '/'
                    ]
                },
                {
                    text: '/',
                    sublist: [
                        '/',
                        '/'
                    ]
                },
                {
                    text: '/',
                    sublist: [
                        '/',
                        '/'
                    ]
                }
            ]
        }
    ]
}


const team = [
    {
        image: '/zr-assets/team/IMG_4148.webp',
        name: 'Puma Universe',
        role: 'Owner'
    },
    {
        image: '/zr-assets/team/nastypb.webp',
        name: 'Nasty',
        role: 'Co-Owner'
    },
    {
        image: '/zr-assets/team/zr-developer.webp',
        name: 'Jacob',
        role: 'Developer'
    },
    {
        image: '/zr-assets/team/zr-developer.webp',
        name: 'Arty',
        role: 'Developer'
    },
    {
        image: '/zr-assets/team/zr-developer.webp',
        name: 'Erkan',
        role: 'Developer'
    },
    {
        image: '/zr-assets/team/zr-developer.webp',
        name: 'Ali',
        role: 'Head Admin'
    },
    {
        image: '/zr-assets/team/zr-developer.webp',
        name: 'Andrew',
        role: 'Head Admin'
    },
    
]
var player;
function onYouTubeIframeAPIReady() {
    player = new YT.Player('zr-youtube-player', {
        videoId: 'h2vv-snKA18', // Replace with the actual YouTube video ID
        playerVars: {
        'autoplay': 0, // When set to 1, the video will automatically start playing as soon as the player loads. If set to 0, the video requires the user to click the play button.
        'controls': 1, //When set to 1, it shows the player controls (play/pause, volume, etc.). If set to 0, the controls are hidden.
        'showinfo': 0, //When set to 1, it displays video title and uploader information. If set to 0, this information is hidden.
        'rel': 0, //When set to 1, related videos are shown at the end of playback. If set to 0, related videos are not shown.
        'fs': 0, //When set to 1, the fullscreen button is displayed. If set to 0, the fullscreen option is disabled.
        'modestbranding': 0 //modestbranding: When set to 1, it removes the YouTube logo from the control bar. If set to 0, the YouTube logo is shown.
        },
        // events: {
        //     'onReady': onPlayerReady
        // }
    });
}

let autoplay = true;
let volume = 100; //Values between 0 and 100
// Define the tracks that have to be played
let track_list = [
    {
      name: "Obsession",
      artist: "Shae Aubrey",
      image: "/zr-assets/musicpics/song1.png",
      path: "/zr-assets/music/song1.mp3"
    },
    {
      name: "Its up",
      artist: "Drake",
      image: "/zr-assets/musicpics/song2.png",
      path: "/zr-assets/music/song2.mp3"
    },
    {
        name: "20 min",
        artist: "Lil Uzi Vert",
        image: "/zr-assets/musicpics/song3.png",
        path: "/zr-assets/music/song3.mp3"
      },
      {
        name: "Turks & Caicos",
        artist: "Rod Wave",
        image: "/zr-assets/musicpics/song4.png",
        path: "/zr-assets/music/song4.mp3"
      },
      {
        name: "H00DBYAIR",
        artist: "Votabias",
        image: "/zr-assets/musicpics/song5.png",
        path: "/zr-assets/music/song5.mp3"
      },
      {
        name: "Get It Sexyy",
        artist: "Sexyy Red",
        image: "/zr-assets/musicpics/song6.png",
        path: "/zr-assets/music/song6.mp3"
      },
      {
        name: "on one tonight",
        artist: "Gunna",
        image: "/zr-assets/musicpics/song7.png",
        path: "/zr-assets/music/song7.mp3"
      },
      {
        name: "Midnight City",
        artist: "M83",
        image: "/zr-assets/musicpics/song8.png",
        path: "/zr-assets/music/song8.mp3"
      },

];