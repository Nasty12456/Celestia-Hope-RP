zr_config = {}
zr_config.zr_translation = {}
zr_trans = zr_config.zr_translation

-- We support the following frameworks: 'QB' / 'ESX'
zr_config.framework = 'QB'
zr_config.QB = 'qb-core'
zr_config.ESX = 'es_extended'

zr_config.zr_blur = 'MenuMGIn'
zr_config.disconnect = '[zr-pausemenu] You have been disconnected from the server'
zr_config.discord = 'https://discord.gg/CanKkZQB4B'
zr_config.link = 'https://celestiahoperp.tebex.io'
zr_config.youtube = 'https://www.youtube.com/channel/UCW6MWCjkXBNZeNjeYCNEpbA'

-- Buttons
zr_config.MulticharacterLogout = false
zr_trans.back = 'Resume'
zr_trans.disconnect = 'Quit'
zr_trans.modal_back = 'BACK'

-- Job list for the overview
zr_config.jobs = {
    {id='police', name='Police', suivname='officers', color='#FFF', icon='zr-assets/zr-icon-job-police.svg'},
    {id='taxi', name='Taxi', suivname='drivers', color='#FFF', icon='zr-assets/zr-icon-job-taxi.svg'},
    {id='ems', name='Ems', suivname='doctors', color='#FFF', icon='zr-assets/zr-icon-job-ems.svg'},
    {id='mechanic', name='Mechanic', suivname='technician', color='#FFF', icon='zr-assets/zr-icon-job-mechanic.svg'},
    {id='realestate', name='Realestate', suivname='brokers', color='#FFF', icon='zr-assets/zr-icon-job-realestate.svg'},
    {id='trucker', name='Trucker', suivname='drivers', color='#FFF', icon='zr-assets/zr-icon-job-trucker.svg'},
    {id='police', name='Police', suivname='officers', color='#FFF', icon='zr-assets/zr-icon-job-police.svg'},
    {id='taxi', name='Taxi', suivname='drivers', color='#FFF', icon='zr-assets/zr-icon-job-taxi.svg'},
    {id='ems', name='Ems', suivname='doctors', color='#FFF', icon='zr-assets/zr-icon-job-ems.svg'},
    {id='mechanic', name='Mechanic', suivname='technician', color='#FFF', icon='zr-assets/zr-icon-job-mechanic.svg'},
    {id='realestate', name='Realestate', suivname='brokers', color='#FFF', icon='zr-assets/zr-icon-job-realestate.svg'},
    {id='trucker', name='Trucker', suivname='drivers', color='#FFF', icon='zr-assets/zr-icon-job-trucker.svg'}
}

-- Total players connected
zr_trans.players_connected = 'Players Connected'

-- Character information
zr_trans.gender = 'Gender'
zr_trans.male = 'MALE'
zr_trans.female = 'FEMALE'
zr_trans.dob = 'Birthdate'
zr_trans.job = 'Job'
zr_trans.cash = 'Cash'
zr_trans.bank = 'Bank'
zr_trans.currency = '$'

-- First row
zr_trans.discord = 'join our discord.'
zr_trans.maps = 'MAPS'
zr_trans.mapstxt = ''
zr_trans.overview = 'OVERVIEW'
zr_trans.overviewtxt = ''
zr_trans.gallery = 'GALLERY'
zr_trans.gallerytxt = ''

-- Second row
zr_trans.settings = 'SETTINGS'
zr_trans.settingstxt = ''
zr_trans.rules = 'RULES'
zr_trans.rulestxt = ''
zr_trans.guide = 'GUIDE'
zr_trans.guidetxt = ''
zr_trans.news = 'NEWS & EVENTS'
zr_trans.newstxt = ''

zr_trans.deleteconf = "Are you sure you want to leave the city?"
zr_trans.deleteconfbuttondelete = "Disconnect"
zr_trans.deleteconfbuttoncancel = "Cancel"

zr_config.News = {
    { 
        title = "Love's Union - Wedding Bash", 
        description = "Join the Racing Extravaganza on March 18th at 8:00 PM GMT for a chance to win $350,000 Dollars and showcase your driving skills.Join the Join the Racing Extravaganza on March 18th at 8:00 PM GMT for a chance to win $350,000 Dollars and showcase your driving skills.",
        rewardTitle = 'April 12th',
        rewardValue = '6:00 PM',
        image = "./zr-assets/news-1.webp"
    },
    { 
        title = "Neon Groove Grand Opening", 
        description = "Join Neon Groove on March 25th for a vibrant nightlife experience with signature cocktails, VIP perks, surprise guests, and a chic opening in town.",
        rewardTitle = 'March 25th',
        rewardValue = '9:00 PM',
        image = "./zr-assets/news-2.webp"
    },
    { 
        title = "LSPD Recruitment Day", 
        description = "Join the LSPD Recruitment Day on April 4th to explore opportunities to serve and protect Los Santos, whether you're a seasoned officer or a newcomer..",
        rewardTitle = 'April 4th',
        rewardValue = '8:00 AM',
        image = "./zr-assets/news-3.webp"
    },
    { 
        title = "Los Santos Race", 
        description = "Join the Racing Extravaganza on March 18th at 8:00 PM GMT for a chance to win $350,000 Dollars and showcase your driving skills.Join the Join the Racing Extravaganza on March 18th at 8:00 PM GMT for a chance to win $350,000 Dollars and showcase your driving skills.",
        rewardTitle = 'Cash Prize:',
        rewardValue = '$350.000',
        image = "./zr-assets/news-4.webp"
    },
}

zr_config.gallery_images = {
    './zr-assets/picture-1.webp',
    './zr-assets/picture-2.webp',
    './zr-assets/picture-3.webp',
    './zr-assets/picture-4.webp',
    './zr-assets/picture-5.webp',
    './zr-assets/picture-6.webp',
    './zr-assets/picture-7.webp',
    './zr-assets/picture-8.webp'
}

zr_config.Guides = {
    { 
        title = "Rules and Roleplay Etiquette", 
        description = {
            {
                title = '',
                message = 'In the bustling metropolis of our roleplay server, a set of rules and roleplay etiquette is crucial to maintaining an enjoyable and immersive environment for everyone. This article serves as your compass, guiding you through the server rules and offering valuable insights into the art of roleplay.'
            },
            {
                title = 'Understanding Server Rules:',
                message = 'Immerse yourself in our community by familiarizing yourself with the server rules. Learn what is expected of you as a player and how to contribute to a positive gaming environment. We ll walk you through the do and dont that shape the foundation of our roleplay experience.'
            },
            {
                title = 'Roleplay Basics:',
                message = 'Explore the fundamental principles of immersive roleplay. From creating realistic scenarios to engaging with other players, this section provides tips for elevating your roleplay skills. Discover the art of staying in character and contributing to a shared narrative that captivates everyone involved.'
            },
            {
                title = 'Common Roleplay Scenarios:',
                message = 'Dive into common roleplay situations you re likely to encounter. Whether its a traffic stop, a business transaction, or an unexpected encounter with law enforcement, we ll provide guidance on how to navigate these scenarios with finesse and authenticity.'
            },
            {
                title = 'Reporting and Resolving Conflicts:',
                message = 'In a dynamic world like ours, conflicts may arise. Learn how to handle in-game disputes and report rule violations effectively. This ensures a fair and enjoyable experience for everyone and helps maintain a positive atmosphere within our community.'
            }
        },
        image = "./zr-assets/guide-1.webp",
        imageThumbnail = "./zr-assets/guidethumbnail-1.webp"
    },
    { 
        title = "Economy ,Jobs and Money", 
        description = {
            {
                title = '',
                message = 'Economic prosperity is the lifeblood of any thriving society, and our roleplay server is no exception. In this article, we explore the in-game economy, from available jobs to managing your hard-earned cash and acquiring properties. Discover the economic interactions that drive our virtual world, and learn how your financial decisions impact not only your character but the broader dynamics of the server. Get ready to master the art of balancing wealth and responsibility in pursuit of your roleplay dreams.'
            },
            {
                title = 'Available Jobs:',
                message = 'Embark on a journey through the various job opportunities available in our virtual city. Whether you re interested in law enforcement, emergency services, or civilian roles, we ve got a diverse range of professions to suit every players preferences. Learn about the responsibilities, perks, and how each job contributes to the thriving in-game economy.'
            },
            {
                title = 'Money Management:',
                message = 'Earning money is just the beginning; managing it wisely is the key to success. From budgeting for everyday expenses to saving up for significant investments, we ll guide you through the nuances of responsible money management. Discover the in-game financial systems that mirror real-world dynamics and ensure a balanced economic experience.'
            },
            {
                title = 'Property Ownership:',
                message = 'Acquiring and managing properties is a significant aspect of your characters journey. This section provides insights into the process of obtaining properties, from residential homes to commercial spaces. Explore the responsibilities that come with property ownership and understand how it can influence your characters roleplay narrative. '
            },
            {
                title = 'Economic Interactions:',
                message = 'Your in-game decisions have a ripple effect on the broader economy. Learn how player actions, from job choices to business transactions, contribute to the overall economic landscape. Understand the interconnected nature of the servers economy and how it shapes the opportunities available to you and your fellow roleplayers.'
            }
        },
        image = "./zr-assets/guide-2.webp",
        imageThumbnail = "./zr-assets/guidethumbnail-2.webp"
    },
    { 
        title = "Advanced Roleplay Techniques", 
        description = {
            {
                title = '',
                message = 'Congratulations! You ve mastered the basics, and now its time to elevate your roleplay experience to new heights. This article is your guide to advanced roleplay techniques, from ongoing character development and complex storylines to active event participation and building meaningful relationships with other characters. Whether you re aiming for a leadership role in a faction or simply seeking to enhance your overall immersion, these advanced tips and strategies will empower you to become a true maestro of storytelling within our vibrant community.'
            },
            {
                title = 'Character Development:',
                message = 'Roleplay is an ongoing journey, and so is your characters development. Explore techniques for adding depth to your character over time, from evolving personality traits to navigating significant life events. This section offers insights into the art of creating a dynamic, three-dimensional character that grows and adapts within the ever-changing landscape of our server.'
            },
            {
                title = 'Complex Storylines:',
                message = 'Take your roleplay to the next level by engaging in complex storylines. Whether you re orchestrating events as a faction leader or participating in server-wide narratives, this guide provides tips for crafting intricate, immersive story arcs. Learn how to collaborate with other players to create memorable moments that contribute to the shared history of our roleplay universe.'
            },
            {
                title = 'Event Participation:',
                message = 'Acquiring and managing properties is a significant aspect of your characters journey. This section provides insights into the process of obtaining properties, from residential homes to commercial spaces. Explore the responsibilities that come with property ownership and understand how it can influence your characters roleplay narrative.'
            },
            {
                title = 'Economic Interactions:',
                message = 'Immerse yourself in the vibrant community events hosted on the server. From large-scale faction conflicts to city-wide celebrations, active event participation can significantly enrich your roleplay experience. This section offers guidance on joining events, contributing meaningfully, and leveraging these opportunities to shape your characters story in impactful ways.'
            }
        },
        image = "./zr-assets/guide-3.webp",
        imageThumbnail = "./zr-assets/guidethumbnail-3.webp"
    },
    { 
        title = "Factions and Gangs",
        description = {
            {
                title = '',
                message = 'In the expansive urban landscape of our roleplay server, factions and gangs play a pivotal role in shaping the narrative. This article is your compass to navigating the intricate world of group dynamics, whether you re joining an existing faction or forging your own path at the helm of a gang. Understanding the dynamics of these organizations will not only enrich your roleplay experience but also contribute to the vibrant tapestry of our servers narrative.'
            },
            {
                title = 'Joining Factions or Gangs:',
                message = 'Discover the diverse array of factions and gangs that call our server home. Whether you re drawn to the order of law enforcement, the adrenaline of a street gang, or the camaraderie of a civilian organization, this section provides guidance on joining existing groups. Learn about the application process, the expectations of members, and how to find a faction that aligns with your characters goals.'
            },
            {
                title = 'Faction Roles:',
                message = 'Once a member of a faction or gang, understanding your role is crucial. Explore the various roles available within these organizations, from leadership positions to specialized roles that contribute to the groups unique identity. This guide offers insights into how each role impacts the factions dynamics and the servers overall narrative.'
            },
            {
                title = 'Roleplay Dynamics:',
                message = 'Engaging in faction or gang roleplay introduces a new layer of complexity. This section delves into the intricacies of in-group interactions, exploring how to navigate conflicts, foster alliances, and contribute to the overarching story of your organization. Learn how your characters actions within the faction context can influence both individual storylines and broader server events.'
            },
            {
                title = 'Faction Events:',
                message = 'Factions and gangs often host events that shape the servers landscape. From organized patrols to city-wide conflicts, this guide provides an overview of faction events and how to participate. Discover the benefits of involvement, from advancing your characters story to contributing to the servers dynamic and ever-evolving narrative.'
            }
        },
        image = "./zr-assets/guide-4.webp",
        imageThumbnail = "./zr-assets/guidethumbnail-4.webp"
    },
    {
        title = "Justice System", 
        description = {
            {
                title = '',
                message = 'In the bustling urban expanse of our roleplay server, the justice system is a cornerstone that adds depth to the immersive experience. This article serves as your guide to understanding the intricate web of law and order, whether you are considering a career in law enforcement, pursuing a legal profession, or simply navigating the consequences of criminal activities.'
            },
            {
                title = 'Police Roleplay:',
                message = 'For those inclined towards justice, this section provides insights into police roleplay. Learn about the responsibilities, challenges, and the day-to-day life of law enforcement officers. Whether you are patrolling the streets, conducting investigations, or responding to emergencies, understanding the nuances of police roleplay will enrich your experience and contribute to the servers dynamic environment.'
            },
            {
                title = 'Legal Professions:',
                message = 'Explore the avenues of legal professions available within the server. From lawyers defending the accused to judges presiding over court cases, this guide outlines the responsibilities and opportunities for those seeking a career within the legal system. Understand how legal roleplay contributes to the servers narrative and shapes the outcomes of in-game conflicts.'
            },
            {
                title = 'Crime and Punishment:',
                message = 'Delve into the consequences of criminal activities within our server. Learn about the justice systems response to criminal actions, from arrests to court proceedings and potential incarceration. This section provides clarity on the in-game repercussions of engaging in illegal activities and the role of law enforcement in maintaining order.'
            },
            {
                title = 'Reporting and Resolving Conflicts:',
                message = 'In a world teeming with diverse characters, conflicts are bound to arise. This guide offers insights into reporting and resolving in-game conflicts, whether they involve criminal activities, disputes between characters, or allegations of rule violations. Understand the appropriate channels for reporting incidents and the role of server administrators in maintaining a fair and enjoyable gaming environment.'
            }
        },
        image = "./zr-assets/guide-5.webp",
        imageThumbnail = "./zr-assets/guidethumbnail-5.webp"
    },
}

zr_config.isKeybindEnabled = false
zr_config.keybinds = {
    {
        key = "/aimedic",
        description = "Calls an npc doctor that is going to help you when you are injured."
    },
    {
        key = "F2",
        description = "opens the Interaction Menu, offering quick access to various in-game features, settings, and actions."
    },
    {
        key = "F3",
        description = "opens the Interaction Menu, offering quick access to various in-game features, settings, and actions."
    },
    {
        key = "F4",
        description = "opens the Interaction Menu, offering quick access to various in-game features, settings, and actions."
    },
    {
        key = "F5",
        description = "opens the Interaction Menu, offering quick access to various in-game features, settings, and actions."
    },
    {
        key = "F6",
        description = "opens the Interaction Menu, offering quick access to various in-game features, settings, and actions."
    },
    {
        key = "/report",
        description = "Report a player or a situation to the staff members."
    }
}