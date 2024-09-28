const app = new Vue({
  el: ".OBug",
  data: {
    isVisible: false, 
    lang: {
      "errorSendReportTitle": "Title must consist of at least 3 words",
      "errorSendReportDescription": "Description must consist of at least 5 words",
      "errorSendReportPriority" : "You need to set a priority.",
      "errorSendReportPlayer" : "You need to set a player.",
      "welcome": "Welcome",
      "players_online": "Players Online",
      "supports_online": "Supports Online",
      "report_menu": "Report Menu",
      "notification": "Notifications",
      "mark_all_as_read": "Mark all as read",
      "my_reports": "My Reports",
      "open": "Open",
      "resolving": "Resolving",
      "closed": "Closed",
      "leave_report_menu": "Leave Report Menu",
      "search_reports": "Search Reports",
      "claimed_reports": "Claimed Reports",
      "staff_leaderboard": "Staff Leaderboard",
      "resolved_reports": "Resolved Reports",
      "all_reports": "All Reports",
      "all_reports_subtitle": "View and manage all submitted reports.",
      "search_admin_reports": "Search reports by title or keyword...",
      "priority": "Priority",
      "categories": "Categories",
      "ticket_id": "Ticket ID",
      "title": "Title",
      "created_by": "Created By",
      "category": "Category",
      "status": "Status",
      "assigned": "Assigned",
      "claimed": "Claimed",
      "claim": "Claim",
      "delete_report_title": "Are you sure you want to delete this report?",
      "connot_be_undone": "This action cannot be undone.",
      "cancel": "Cancel",
      "submit": "Submit",
      "yes_delete": "Yes, Delete",
      "main_title": "Report Unwanted Situations",
      "main_subtitle": "Help us maintain a fair and enjoyable gaming environment. Select an issue to report.",
      "found_a_bug": "Found a bug?",
      "found_a_bug2": "Help us fix it!",
      "send_report": "Send Report",
      "player_misconduct": "Player Misconduct",
      "player_misconduct2": "Seen inappropriate actions?",
      "have_a_question": "Have a question?",
      "have_a_question2": "We’ve got the answers.",
      "asked_questions": "Frequently Asked Questions",
      "asked_questions2": "Find answers to common questions and learn how to use the report system.",

      "report_a_system_issue": "Report a System Issue",
      "report_player_misconduct": "Report Player Misconduct",
      "ask_a_questions": "Ask a Question",
      "detailed_information": "Please provide detailed information about the system issue to help us address it promptly.",
      "enter_a_brief_title": "Enter a brief title for your report",
      "player": "Player",
      "enter_description": "Describe the system issue in detail",
      "attach_files": "Attach files",
      "attach_files2": "You can attach screenshots or other files to provide more context for your report.",
      "upload_complate": "Upload complete",
      "select_files": "Select Files",
      "select_files2": "Browse and select relevant videos or pictures from the database to attach to your report.",
      "add_selected_files": "Add Selected Files",
      "attach_files_links": "Attach Files Links",
      "delete_files": "Delete Files",
      "cancel_and_return": "Cancel and Return",

      "website_url": "Website URL",

      "mark_as_solved": "Mark as Solved",
      "marked_as_solved": "Marked as Solved",
      "me": "Me",
      "name": "Name",
      "in_game_id": "In Game ID",
      "identifier": "Identifier",
      "support_staff": "Support Staff",
      "this_ticlet_was_marked": "This Ticket Was Marked as Solved by ",
      "enter_your_message": "Enter Your Message",
      "mark_this_report": "Are you sure you want to mark this report as done?",
      "yes_mark_solved": "Yes, Mark as Solved",
      "player_nickname": "Player Nickname",
      "discord_name": "Discord Name",
      "discord_id": "Discord ID",
      "steam_id": "Steam ID",
      "license_id": "License ID",
      "total_playtime": "Total Playtime",
      "player_info": "Player Info",
      "staff_action": "Staff Action",
      "logs": "Logs",
      "goto": "Go to",
      "bring": "Bring",
      "heal": "Heal",
      "freeze": "Freeze",
      "kill": "Kill",
      "revive": "Revive",
      "kick": "Kick",
      "rec": "REC",
      "uploading_media": "Uploading Media"
    },
    page: "main", // main, send-report, select-media, view-video-img, chat, admin-main, admin-chat
    admin: false,
    selectAdminCategory: "claimed", // leaderboard, claimed
    deleteTicketID: null,
    lastpage: "",
    lastViewMedia: false,
    solvedBox: false,
    knotification: false,
    deleteTicketBox: false,
    deleteGalleryBox: false,
    attachFilesLinkBox: false,
    attachLink: "",
    staffaction: true,
    addUserCommand: "adduser",
    addUserCommandUseAdmin: false,
    searchMyReport: "",
    playerProfilInfo: {
      identifier: "231",
      name: "John Smith",
      avatar: "./img/avatar.png",
      discordName: "JohnSmith#312",
      discordID: "5678901256789012",
      steamID: "5678901256789012",
      licenseID: "123456789012345678",
      playTime: 150,
      id: "31"

    },
    aNotification: [],
    logs: {},
    questions: [],
    gallery: [],
    selectMedia: [],

    sendReportNotification: [],

    selectChatMedia: [],
    messageText: "",

    currentNotification: null,
    currentIndex: 0,
    timeoutId: null,

    ticket: {},
    leaderboard: {},
    selectionTicketID: null,

    

    viewMediaURL: "https://i.pinimg.com/originals/8e/17/86/8e17865eebb2cc1d13b66778c011fcb5.png",

    allPlayerList: {},
    playerList: {},
    playTime: {},
    supportList: [],
    sendReport: {
      selectedPriority: null,
      title: "",
      description: "",
      selectMedia: [],
      selectCategory: "",
      selectPlayer: null,
    },
    priorityList:  [
      {
        text: "Critical",
        type: 'critical',
        color: '#F53D6B'
      },
      {
        text: "Important",
        type: 'important',
        color: '#FFA500'
      },
      {
        text: "Normal",
        type: 'normal',
        color: '#4CAF50'
      },
    ],
    categoryList: [
      {
        text: "System Issue",
        type: "bug"
      },
      {
        text: "Player Report",
        type: "player"
      },
      {
        text: "Question",
        type: "question"
      },
    ],


    fakeUser: {
      identifier: "31"
    },
    isCheckedPlayer: true,
    isCheckedPriority: true,

    isCheckedFilterPriority: true,
    filterPriority: [],

    isCheckedFilterCategory: true,
    filterCategory: [],

    searchAdminMain: "",
  },
  
  methods: {
    openNotificationTicket(item, ticketID) {
      if (this.ticket[ticketID]) {
        this.selectionTicketID = ticketID
        if(this.admin) {
          this.page = 'admin-chat';

        } else {
          this.page = 'chat';

        }
        setTimeout(() => {
          this.scrollToBottom()
        }, 1000);
      }

      const index = this.aNotification.indexOf(item);
      if (index > -1) {
        this.aNotification.splice(index, 1);
      }
    },
    aAddNotification(icon, title, description, time, ticketID) {
      const notification = {
        title: title,
        description: description,
        time: time,
        ticketID: ticketID,
        icon: icon,
        isVisible: true  // Yeni eklenen özellik
      };
      
      this.aNotification.unshift(notification);
      

      setTimeout(() => {
        this.removeNotification(notification);
      }, 5000);
    },
  
    removeNotification(notification) {
      const index = this.aNotification.indexOf(notification);
      if (index > -1) {
        this.aNotification[index].isVisible = false;
      }
    },
    selectedFilterPriority(priority) {
      // Toggle priority filter
      if (this.filterPriority.includes(priority.type)) {
        this.filterPriority = this.filterPriority.filter(p => p !== priority.type);
      } else {
        this.filterPriority.push(priority.type);
      }
    },
    isSelectedPriority(item) {
      return this.filterPriority.some(priority => priority === item.type);
    },
    selectedFilterCategory(priority) {
      // Toggle category filter
      if (this.filterCategory.includes(priority.type)) {
        this.filterCategory = this.filterCategory.filter(p => p !== priority.type);
      } else {
        this.filterCategory.push(priority.type);
      }
    },
    isSelectedCategory(item) {
      return this.filterCategory.some(priority => priority === item.type);
    },
    shortenText(text, maxLength) {
      if (text.length > maxLength) {
        return text.substring(0, maxLength - 3) + '...';
      } else {
        return text;
      }
    },
    handleScroll(event) {
      event.preventDefault();
      const container = this.$refs.scrollContainer;
      container.scrollLeft += event.deltaY;
    },
    Question(index) {
      this.questions.forEach((item, i) => {
          if (i === index) {
              item.visible = !item.visible;
          } else {
              item.visible = false;
          }
      });
    },
    lastPage() {
      this.page = this.lastpage;
      this.gallery.forEach((item, i) => {
        
        item.select = false;
        
      });
      this.selectMedia = {}
      this.sendReport.selectMedia = []
      this.selectChatMedia = []
      setTimeout(() => {
				this.scrollToBottom()
			}, 1000);
    },
    saveLastPage() {
     

      if (this.lastpage === 'chat' || this.lastpage === 'admin-chat') {

        this.addMessage()

        this.gallery.forEach((item, i) => {
          item.select = false;
        });
        this.selectChatMedia = []
      }

      this.page = this.lastpage;
      setTimeout(() => {
				this.scrollToBottom()
			}, 1000);
    },
    testMessage() {
      if(this.selectionTicketID) {
        const messages = [
          "Hey, nasılsın?",
          "Bugün neler yaptın?",
          "Yarın buluşalım mı?",
          "Film izlemeyi seviyor musun?",
          "Hangi müzikleri dinlersin?",
          "Tatilde nereye gitmeyi planlıyorsun?",
          "Yeni bir kitap okumaya başladım.",
          "Bugün hava çok güzel.",
          "Çalışma nasıl gidiyor?",
          "Biraz dinlenmeye ihtiyacım var."
        ];
        
        const getRandomMessage = () => {
          const randomIndex = Math.floor(Math.random() * messages.length);
          return messages[randomIndex];
        };
  
        const firstMessage = {
          message: getRandomMessage(),
          media: [
            {
              fileURL: "https://images.pexels.com/photos/15804651/pexels-photo-15804651/free-photo-of-yol-peyzaj-manzara-daglar.jpeg",
              fileName: "aaaa.jpeg",
              fileDate: "",
              select: false,
              id: "M99"
            },
            {
              fileURL: "https://images.pexels.com/photos/26754397/pexels-photo-26754397/free-photo-of-deniz-safak-gun-dogumu-peyzaj.jpeg",
              fileName: "manzara.jpeg",
              fileDate: "",
              select: false,
              id: "M931"
            },
          ],
          date: this.getFormattedDate(),
          identifier: this.fakeUser.identifier,
          name: this.fakeUser.name,
          avatar: this.fakeUser.avatar
        }
        this.gallery.forEach((item, i) => {
          item.select = false;
        });
        this.selectChatMedia = []
        this.ticket[this.selectionTicketID].messages.push(firstMessage);
        this.messageText = ""
        setTimeout(() => {
          this.scrollToBottom()
        }, 1000);
      } else {
        this.aAddNotification("ticket","Claimed Report", "Claimed report by OBug", 5000, "62c2-bab4-6f9f-c8e0");
      }
    }, 
    addMessage(text, media) {


    

      const command = this.addUserCommand;
      const regex = new RegExp(`^/${command}\\s+(\\d+)`);
      const match = this.messageText.match(regex);
      if (match) {
        if (!this.addUserCommandUseAdmin || this.playerProfilInfo.admin) {
          const id = parseInt(match[1]); // ID'yi yakala ve tam sayıya çevir
          const playerListIds = Object.values(this.playerList).map(player => player.id); // playerList içindeki tüm ID'leri al
     
          if (playerListIds.includes(id)) {
            
            axios.post(`https://${GetParentResourceName()}/addUserTicket`, {
              userId: id,
              ticketID: this.selectionTicketID
            });
  
            this.messageText = ""
            this.scrollToBottom()
            this.addNotification(
              "send-report",
              "success",
              "Added to player report request",
              "",
              5000
            )
          } else {
            this.addNotification(
              "send-report",
              "error",
              "Player not found",
              "",
              5000
            )
          }
        } else {
          this.addNotification(
            "send-report",
            "error",
            "You must be admin to use the command",
            "",
            5000
          )
        }
      } else {
        if(this.selectionTicketID) {
          if(this.messageText !== "" || this.selectChatMedia.length !== 0 ) {
            const firstMessage = {
              message: this.messageText,
              media: this.selectChatMedia,
              date: this.getFormattedDate(),
              identifier: this.playerProfilInfo.identifier,
              name: this.playerProfilInfo.name,
              avatar: this.playerProfilInfo.avatar
            }
            this.gallery.forEach((item, i) => {
              item.select = false;
            });
            this.selectChatMedia = []
            axios.post(`https://${GetParentResourceName()}/addMessage`, {
              message: firstMessage,
              ticketID: this.selectionTicketID
            });
  
            // this.ticket[this.selectionTicketID].messages.push(firstMessage);
            this.messageText = ""
            this.scrollToBottom()
          }
        }
      }
      

        
    },


    claimTicket(ticket) {
      axios.post(`https://${GetParentResourceName()}/claim`, {
        playerProfilInfo: this.playerProfilInfo,
        ticketID: ticket.ticketID
      });
    },

    openGallery(i) {
      this.page = 'select-media';
      this.lastpage = i
    },
    selectsMedia(index) {

      if(this.lastpage == 'send-report') {
        this.gallery.forEach((item, i) => {
          if (i === index) {
            item.select = !item.select;
            if (item.select === false) {
              const Xindex = this.sendReport.selectMedia.findIndex(x => x.id === item.id);
              if (Xindex !== -1) {
                this.sendReport.selectMedia.splice(Xindex, 1);
              }
            } else {
              this.sendReport.selectMedia.push(item);
            }
          } 
        });
      } else if(this.lastpage == 'chat' || this.lastpage == 'admin-chat') {
        this.gallery.forEach((item, i) => {
          if (i === index) {
            item.select = !item.select;
            if (item.select === false) {
              const Xindex = this.selectChatMedia.findIndex(x => x.id === item.id);
              if (Xindex !== -1) {
                this.selectChatMedia.splice(Xindex, 1);
              }
            } else {
              this.selectChatMedia.push(item);
            }
          } 
        });
      }
     
      
    },
    deleteGalleryItem() {
      if (this.deleteGalleryBox) {
        this.deleteGalleryBox = false;
    
        // Seçili olan öğeleri kaldır
        this.gallery = this.gallery.filter(item => !item.select);
    
        // POST işlemini döngü tamamlandıktan sonra yap
        axios.post(`https://${GetParentResourceName()}/deleteGallery`, {
          gallery: this.gallery,
          playerInfo: this.playerProfilInfo
        });
    
      } else {
        this.deleteGalleryBox = true;
      }
    },
    

    generateMediaId() {
      // Crypto modülü ile rastgele bir ticketId oluşturma
      return 'xxxx-xxxx'.replace(/[x]/g, () => {
        const random = Math.floor(Math.random() * 16).toString(16);
        return random;
      });
    },
    attachFilesLink() {
      const validExtensions = ['jpg', 'jpeg', 'png', 'gif', 'mp4', 'avi', 'mov'];
      if (this.attachFilesLinkBox) {
        if (this.attachLink !== "") {
          const linkExtension = this.attachLink.split('.').pop().toLowerCase();
          if (validExtensions.includes(linkExtension)) {
            const mediaId = this.generateMediaId();
            const data = {
              fileURL: this.attachLink,
              fileName: mediaId+"."+linkExtension,
              fileDate: this.getFormattedDate(),
              select: false,
              id: mediaId,
            }
            if(linkExtension === 'mp4' || linkExtension === 'avi' || linkExtension === 'mov') {
              data.video = true
            }
            this.gallery.push(data)
            axios.post(`https://${GetParentResourceName()}/attachFiles`, {
              data: data,
              playerInfo: this.playerProfilInfo
            });
            

            this.addNotification(
              "send-report",
              "success",
              "Installed successfully",
              "",
              5000
            )
            this.attachFilesLinkBox = false;
            this.attachLink = ""
          } else {
            // Invalid file, show error or handle accordingly
            this.addNotification(
              "send-report",
              "error",
              "Invalid file type",
              "",
              5000
            )
          }
        } else {
          this.addNotification(
            "send-report",
            "error",
            "You need to write the link in the appropriate format.",
            "",
            5000
          )
        }
      } else {
        this.attachFilesLinkBox = true;
      }
    },
    closeAdminChat() {
      this.page = 'admin-main';
      this.selectionTicketID = null;
    },
    
    newSendReport() {

      if(this.sendReport.title.split(' ').length > 2) {
        if(this.sendReport.description.split(' ').length > 4) {
          if(this.sendReport.selectedPriority !== null) {
            if(this.sendReport.selectCategory.type === 'player' && this.sendReport.selectPlayer !== null) {
              this.newReport(
                this.sendReport.title,
                this.sendReport.description,
                this.sendReport.selectedPriority,
                this.sendReport.selectCategory,
                this.sendReport.selectMedia,
                this.sendReport.selectPlayer,
              )
              // this.page = "main";
              this.sendReport.title = ""
              this.sendReport.description = ""
              this.sendReport.selectedPriority = null
              this.sendReport.selectPlayer = null
              this.sendReport.selectCategory = ""
              this.sendReport.selectMedia = []
              
              this.gallery.forEach((item, i) => {
                item.select = false;
              });
            } else if (this.sendReport.selectCategory !== 'player') {
              this.newReport(
                this.sendReport.title,
                this.sendReport.description,
                this.sendReport.selectedPriority,
                this.sendReport.selectCategory,
                this.sendReport.selectMedia
              )
              // this.page = "main";
              this.sendReport.title = ""
              this.sendReport.description = ""
              this.sendReport.selectedPriority = null
              this.sendReport.selectCategory = ""
              this.sendReport.selectMedia = []
              
              this.gallery.forEach((item, i) => {
                item.select = false;
              });
            } else {
              this.addNotification(
                "send-report",
                "error",
                this.lang["errorSendReportPlayer"],
                "",
                5000
              )
            }
          } else {
            this.addNotification(
              "send-report",
              "error",
              this.lang["errorSendReportPriority"],
              "",
              5000
            )
          }
        } else {
          this.addNotification(
            "send-report",
            "error",
            this.lang["errorSendReportDescription"],
            "",
            5000
          )
        }

      } else {
        this.addNotification(
          "send-report",
          "error",
          this.lang["errorSendReportTitle"],
          "",
          5000
        )
      }
    },

    scrollToBottom() {
			const container = this.$refs.chatContainer;
      
      if (container && container.scrollHeight !== undefined) {
        anime({
          targets: container,
          scrollTop: container.scrollHeight,
          duration: 800,
          easing: 'easeInOutQuad'
        });
      }
		},

    clickSolved() {
      this.solvedBox = false
      // this.ticket[this.selectionTicketID].solved = true;
      // this.ticket[this.selectionTicketID].status = "closed";
      // this.ticket[this.selectionTicketID].solvedPlayer = this.playerProfilInfo;
      // this.ticket[this.selectionTicketID].ticketOldOwner = this.ticket[this.selectionTicketID].ticketOwner
      // this.ticket[this.selectionTicketID].ticketOwner = "solved"

      axios.post(`https://${GetParentResourceName()}/clickSolved`, {
        selectionTicketID: this.selectionTicketID,
        solvedPlayer: this.playerProfilInfo
      });
      this.page = "main"
    },
    clickOpenDeleteTicket(ticket) {
      this.deleteTicketID = ticket.ticketID;
      this.deleteTicketBox = true;
    },
    clickTicketDelete() {
     
      this.$delete(this.ticket, this.deleteTicketID);
      axios.post(`https://${GetParentResourceName()}/deleteTicket`, {
        deleteTicketID: this.deleteTicketID,
        player: this.playerProfilInfo
      });
      this.deleteTicketBox = false;
    },

    generateTicketId() {
      // Crypto modülü ile rastgele bir ticketId oluşturma
      return 'xxxx-xxxx-xxxx-xxxx'.replace(/[x]/g, () => {
        const random = Math.floor(Math.random() * 16).toString(16);
        return random;
      });
    },
    generateUniqueTicketId() {
      let ticketID;
      do {
        ticketID = this.generateTicketId();
      } while (this.ticket[ticketID] !== undefined);
      return ticketID;
    },
    getFormattedDate() {
      const now = new Date();
    
      const day = String(now.getDate()).padStart(2, '0');
      const month = String(now.getMonth() + 1).padStart(2, '0'); // Aylar 0-11 arası olduğu için 1 ekliyoruz
      const year = now.getFullYear();
      const hours = String(now.getHours()).padStart(2, '0');
      const minutes = String(now.getMinutes()).padStart(2, '0');
    
      return `${day}-${month}-${year} ${hours}:${minutes}`;
    },
    newReport(title, description, priority, category, media, player) {
      const ticketID = this.generateUniqueTicketId();
   
      const firstMessage = {
        message: description,
        media: media,
        date: this.getFormattedDate(),
        identifier: this.playerProfilInfo.identifier,
        name: this.playerProfilInfo.name,
        avatar: this.playerProfilInfo.avatar,
        player: player,
        
      }
      
      const newTicket = {
        ticketID: ticketID,
        ticketOwner: this.playerProfilInfo.identifier,
        ticketOwnerDetails: this.playerProfilInfo,
        category: category,
        title: title,
        description: description,
        priority: priority,
        date: this.getFormattedDate(),
        status: "resolving",
        claimed: false,
        claimedAdmin: [],
        addUser: [],
        messages: [],
        solved: false
        
      }

      newTicket.messages.push(firstMessage);
     
      this.$set(this.ticket, ticketID, newTicket); // TicketID'yi kayıt et ve reaktif hale getir
      axios.post(`https://${GetParentResourceName()}/newReport`, {
        playerInfo: this.playerProfilInfo,
        ticket: newTicket
      });
    
      setTimeout(() => {
        this.selectionTicketID = ticketID;
        this.page = 'chat';
			}, 300);
      
    },

    exitChat() {
      this.page = 'main';
      this.selectionTicketID = null;
    },
    openReport(ticketID) {
    
      this.selectionTicketID = ticketID
      this.page = 'chat';
      setTimeout(() => {
				this.scrollToBottom()
			}, 1000);

    },

    openAdminReport(ticketID) {
   
      this.selectionTicketID = ticketID
      this.page = 'admin-chat';
      setTimeout(() => {
				this.scrollToBottom()
			}, 1000);

    },

    openSendReport(category) {
      this.categoryList.forEach((item, i) => {
        if (item.type === category) {
          this.sendReport.selectCategory = item;
        }
      });
      this.page = 'send-report'
    },
    

    viewMedia(item, lastpage, out) {
      this.page = "view-video-img";
      this.lastViewMedia = out;
      if(!this.lastViewMedia && lastpage) {
        this.lastpage = lastpage;

      }
      this.viewMediaURL = item;
    },
    viewClose() {
      if(this.lastViewMedia) {
        this.page = 'select-media';
      } else {
        this.page = this.lastpage;

      }
    },
    clickAction(action) {
      if(this.playerList[this.ticket[this.selectionTicketID].ticketOwnerDetails.identifier]) {

        axios.post(`https://${GetParentResourceName()}/actions`, {
          type: action,
          userID: this.playerList[this.ticket[this.selectionTicketID].ticketOwnerDetails.identifier].id
        });

        this.addNotification(
          "send-report",
          "success",
          "Action realized",
          "",
          5000
        )
      } else {
        this.addNotification(
          "send-report",
          "error",
          "Action could not be realized",
          "",
          5000
        )
      }
    },
    handleEventMessage(event) {
      const item = event.data;
      switch (item.data) {
        case "OpenUI":
          this.playerProfilInfo = item.playerProfilInfo;
          this.gallery = item.gallery;
          this.leaderboard = item.leaderboard;
     
          this.playerList = item.playerList;
          this.ticket = item.ticket;
          this.playTime = item.playTime;
     
          // this.page = "", // main, send-report, select-media, view-video-img, chat, admin-main, admin-chat
          this.admin = false;
          this.isVisible = true;
          this.logs = item.logs;
          this.questions = item.questions;
          this.lang = item.lang;
          this.priorityList = item.priorityList;
          this.categoryList = item.categoryList;
          this.addUserCommand = item.addUserCommand;
          this.addUserCommandUseAdmin = item.addUserCommandUseAdmin
          if(this.playerProfilInfo.admin) {
            this.admin = this.playerProfilInfo;
            this.page = "admin-main"
          }
        break;

        case "ticketData":
          this.ticket = item.ticket;
          setTimeout(() => {
            this.scrollToBottom()
          }, 1000);
        break;

        case 'exitTicket':
          if(item.ticketID === this.selectionTicketID) {
            if(this.playerProfilInfo.admin) {
              this.page = "admin-main";
              this.selectionTicketID = null;
            } else {
              this.page = "main";
              this.selectionTicketID = null;
            }
          }

        break;
        case 'updatePlayerList':
          this.playerList = item.playerList;
        break;
        case 'addNotification': 
          if (this.selectionTicketID !== item.item.ticketID) {
            this.aAddNotification(item.item.icon,item.item.title, item.item.description, item.item.time, item.item.ticketID);

          }
        break;
        case 'updateGallery':
          this.gallery = item.gallery;
        break;
        case 'updateLeaderboard':
          this.leaderboard = item.leaderboard;
        break;
      }
    },
    

    addNotification(page, type, title, description, time) {
      // Mevcut bildirimi oluştur
      const newNotification = {
        type: type,
        title: title,
        description: description,
        time: time || 5000,
      };
    
      // Bildirimlerin daha önce eklenip eklenmediğini kontrol et
      const notificationExists = this.sendReportNotification.some(notification => {
        return notification.type === newNotification.type &&
               notification.title === newNotification.title &&
               notification.description === newNotification.description &&
               notification.time === newNotification.time;
      });
    
      // Eğer bildirim yoksa ekle
      if (!notificationExists) {
        this.sendReportNotification.push(newNotification);
      }
    },
    



    showNextNotification() {
      if (this.currentIndex < this.sendReportNotification.length) {
        this.currentNotification = this.sendReportNotification[0];
        const notificationTime = this.currentNotification.time;

        this.timeoutId = setTimeout(() => {
          this.currentNotification = null;

          this.sendReportNotification.splice(0, 1);
          this.showNextNotification();
         
        }, notificationTime);
      }
    },
    closeNotification(page) {
      if(page == 'send-report') {
        clearTimeout(this.timeoutId);
        this.sendReportNotification.splice(0, 1);
        this.currentNotification = null;
        this.showNextNotification();

      }
    },
    ticketWithIds(menu) {
      let ticketsToMap = Object.values(this.ticket).filter(ticket => 
          ticket.ticketOwner === this.playerProfilInfo.identifier || 
          ticket.addUser.some(user => user.identifier === this.playerProfilInfo.identifier)
      );
  
      return ticketsToMap.map((ticket, index) => {
          return {
              ...ticket,
              id: index
          };
      });
    },
    adminTicketWithIds(menu) {
      let ticketsToMap = Object.values(this.ticket).filter(ticket => 
          ticket.claimedAdmin.some(admin => admin.identifier === this.playerProfilInfo.identifier) ||
          ticket.addUser.some(user => user.identifier === this.playerProfilInfo.identifier)
      );
  
      return ticketsToMap.map((ticket, index) => {
          return {
              ...ticket,
              id: index
          };
      });
    },
  
    
    leaderBoardWith(menu) {
			let ticketsToMap = Object.values(this.leaderboard);

      // Sort tickets by resolved reports in descending order
      ticketsToMap.sort((a, b) => b.resolvedCount - a.resolvedCount);

      return ticketsToMap.map((ticket, index) => {
        return {
          ...ticket,
          id: index + 1 // Assign ranking based on sorted position
        };
      });
		},

    handlePriorityChange(priority) {
      if (this.filterPriority.includes(priority)) {
        this.filterPriority = this.filterPriority.filter(p => p !== priority);
      } else {
        this.filterPriority.push(priority);
      }
    },
    handleCategoryChange(category) {
      if (this.filterCategory.includes(category)) {
        this.filterCategory = this.filterCategory.filter(c => c !== category);
      } else {
        this.filterCategory.push(category);
      }
    },
    handleSearchChange(event) {
      this.searchAdminMain = event.target.value;
    },


    leaveReportMenu() {
      this.isVisible = false;
      axios.post(`https://${GetParentResourceName()}/closeMenu`, {});

    },
    copyText(item) {
      const textarea = document.createElement('textarea');
			textarea.value = item;

		
			document.body.appendChild(textarea);

			
			textarea.select();
			textarea.setSelectionRange(0, 99999);

			
			document.execCommand('copy');

			document.body.removeChild(textarea);
    }
  },
  watch: {
    sendReportNotification(newVal, oldVal) {
     
      if (newVal.length > 0 && !this.currentNotification) {
        this.showNextNotification();
      }
    }
  },
  created() {
    window.addEventListener("message", this.handleEventMessage);

   


  },
  beforeDestroy() {
    const container = this.$refs.scrollContainer;
    container.removeEventListener('wheel', this.handleScroll);
  },
  mounted() {
    const container = this.$refs.scrollContainer;
    container.addEventListener('wheel', this.handleScroll);
    this.showNextNotification();
  },
  computed: {
    formattedMessages() {

      return this.ticket[this.selectionTicketID].messages.map(msg => {
        return {
          ...msg,
          type: msg.identifier === this.playerProfilInfo.identifier ? 'me' : 'you',
          
        };
      });
			
		},
    filteredTicket(menu) {
      if (!this.searchMyReport.trim()) {
          return this.ticketWithIds().sort((a, b) => {
              let dateA = new Date(a.date),
                  dateB = new Date(b.date);

              return dateB - dateA; // Büyükten küçüğe sıralama
          });
      }

      const searchLowerCase = this.searchMyReport.toLowerCase();
      return this.ticketWithIds().filter(ticket =>
          ticket.title.toLowerCase().includes(searchLowerCase)
      );
    },
    adminFilteredTicket(menu) {
  
        return this.adminTicketWithIds().sort((a, b) => {
            let dateA = new Date(a.date),
                dateB = new Date(b.date);

            return dateB - dateA; // Büyükten küçüğe sıralama
        });
      

      
    },

    adminMainFilteredTicket() {
      let ticketsArray = Object.values(this.ticket);
  
      if (this.filterPriority.length > 0) {
        ticketsArray = ticketsArray.filter(ticket => this.filterPriority.includes(ticket.priority.type));
      }

  
      if (this.filterCategory.length > 0) {
        ticketsArray = ticketsArray.filter(ticket => this.filterCategory.includes(ticket.category.type));
      }

      // ticketsArray = ticketsArray.map(ticket => ({
      //   ...ticket,
      //   claimed: ticket.claimedAdmin.some(admin => admin.identifier === this.playerProfilInfo.identifier)
      // }));

      const searchLowerCase = this.searchAdminMain.toLowerCase();
      return ticketsArray.filter(ticket =>
          ticket.title.toLowerCase().includes(searchLowerCase)
      );
  
      


  
      return ticketsArray;
    },
    sortedAdminLeaderboard() {
      return this.leaderBoardWith();
    },
    log() {
      let ticketsArray = Object.values(this.logs[this.ticket[this.selectionTicketID].ticketOwner]);

      return ticketsArray;
    },
    playersCount() {
      return Object.keys(this.playerList).length;
    },

    supportsCount() {
      return Object.values(this.playerList).filter(player => player.admin).length;
    },
  }
});

document.onkeyup = function (event) {
  if (event.key === "Escape" && app.isVisible) {
    axios.post(`https://${GetParentResourceName()}/closeMenu`, {});
    app.isVisible = false;
  } else if(event.key === "Enter" && (app.page === "admin-chat" || app.page === "chat")) {
    app.addMessage()
  }
};
