$('body').hide();

var CurrentMusicPlayerName = null
let VideoIndexInMusicPlayer = 0;
let CurrentVideoIndexInMusicPlayer = 0;


function GetElementByClassName(className) {
    return $('.' + className)
}

function GetElementByIdentifier(identifier) {
    return $('#' + identifier)
}

function GetElementByTagName(tagName) {
    return $(tagName)
}

function SendClientEvent(action, data) {
    $.post('https://ngd-dj/'+action, JSON.stringify(data));
}

// User Interraction

$('#AddYoutubeVideo').click(function () { 
    GetElementByClassName('YoutubeVideoAdder').css('display','flex');
})

$('#CancelYoutubeVideo').click(function () { 
    GetElementByClassName('YoutubeVideoAdder').css('display','none'); 
})

$('#SubmitYoutubeVideo').click(function () {
    var url = $('.YoutubeVideo').val();
    GetElementByClassName('YoutubeVideo').val('');
    GetElementByClassName('YoutubeVideoAdder').css('display','none');
    if (IsValidYouTubeUrl(url)) {
        var video_id = GetYoutubeVideoId(url);
        SendClientEvent('NewVideo', { name : CurrentMusicPlayerName, video_id : video_id})
        UpdatePlayList({id : video_id, playing : false});   
    }
})

$('input[type=range]').on('input', function () {
    SendClientEvent('ChangeVolume', { name : CurrentMusicPlayerName, volume : $(this).val() / 100})
});

$('#close').click(function () { 
    Close();
})

// Events

window.addEventListener('message', function (event) {
    let e = event.data;
    switch (e.action) {     
        case "ShowMusicPlayer":
            ShowMusicPlayer(e.data);
            break;
        default: break;
    }
});

$(function () {
	$(document).keyup(function (e) {
		let keyCode = e.keyCode || e.which;
		if (keyCode == 27) {
            Close();
		}
	});
});

function Close() {
    SendClientEvent('close', {})
    GetElementByClassName('video_boxes').html('');
    GetElementByClassName('Title').html('');
    VideoIndexInMusicPlayer = 0;
    CurrentVideoIndexInMusicPlayer = 0;
    ResetAllStyles();
    GetElementByTagName('body').hide();
}

// Functions

function ShowMusicPlayer(data) {
    CurrentMusicPlayerName = data.name;
    GetElementByClassName('Title').html(data.musicPlayerData.title);
    CreatePlaylist(data);
    GetElementByTagName('body').show();
}

function CreatePlaylist(data) {
    for (const video of data.musicPlayerData.playlist) {
        UpdatePlayList(video);
    }
}

function PlayYoutubeVideo(video_id, video_index) { 
    SendClientEvent('PlayVideo', {name : CurrentMusicPlayerName, video_id : video_id, previous_video_index : parseInt(CurrentVideoIndexInMusicPlayer), current_video_index : parseInt(video_index)}) 
    UpdateCover(video_id);
    UpdatePlayListActions(video_index);
}

function ReplayYoutubeVideo(video_id, video_index) { 
    SendClientEvent('ReplayVideo', {name : CurrentMusicPlayerName, video_id : video_id, current_video_index : parseInt(video_index)}) 
    GetElementByIdentifier('video_'+video_index+' .play').css('display','none');
    GetElementByIdentifier('video_'+video_index+' .pause').css('display','block');
    GetElementByIdentifier('video_'+video_index+' .replay').css('display','block');
    GetElementByIdentifier('video_'+video_index+' .equalizer').css('display','block'); 
}

function PauseYoutubeVideo(video_index) {
    GetElementByIdentifier('video_'+video_index+' .play').css('display','block');
    GetElementByIdentifier('video_'+video_index+' .pause').css('display','none'); 
    SendClientEvent('PauseVideo', {name : CurrentMusicPlayerName, current_video_index : parseInt(video_index)}) 
}

function UpdateCover(video_id) {
    GetElementByClassName('current').css('background',`url('https://img.youtube.com//vi/${video_id}/0.jpg') center center`);
    GetElementByClassName('current').css('background-size',`contain`);
    GetElementByClassName('current').css('background-repeat',`no-repeat`);
}

function RemoveYoutubeVideo(video_id, video_index) {
    GetElementByIdentifier('video_'+video_index).css('display','none');
    SendClientEvent('RemoveVideo', {name : CurrentMusicPlayerName, video_index : parseInt(video_index)}) 
    if(video_index == CurrentVideoIndexInMusicPlayer) {
        ResetCover()
    }
}

function UpdatePlayListActions(video_index) {
    if (CurrentVideoIndexInMusicPlayer == 0 ) {
        CurrentVideoIndexInMusicPlayer = video_index;
        GetElementByIdentifier('video_'+video_index+' .play').css('display','none');
        GetElementByIdentifier('video_'+video_index+' .pause').css('display','block');
        GetElementByIdentifier('video_'+video_index+' .replay').css('display','block');
        GetElementByIdentifier('video_'+video_index+' .equalizer').css('display','block'); 
    }
    else if (CurrentVideoIndexInMusicPlayer != video_index) {
        GetElementByIdentifier('video_'+CurrentVideoIndexInMusicPlayer+' .play').css('display','block');
        GetElementByIdentifier('video_'+CurrentVideoIndexInMusicPlayer+' .pause').css('display','none');
        GetElementByIdentifier('video_'+CurrentVideoIndexInMusicPlayer+' .replay').css('display','none');
        GetElementByIdentifier('video_'+CurrentVideoIndexInMusicPlayer+' .equalizer').css('display','none'); 
        GetElementByIdentifier('video_'+video_index+' .play').css('display','none');
        GetElementByIdentifier('video_'+video_index+' .pause').css('display','block');
        GetElementByIdentifier('video_'+video_index+' .replay').css('display','block');
        GetElementByIdentifier('video_'+video_index+' .equalizer').css('display','block'); 
        CurrentVideoIndexInMusicPlayer = video_index;
    }
    else{
        GetElementByIdentifier('video_'+video_index+' .play').css('display','none');
        GetElementByIdentifier('video_'+video_index+' .pause').css('display','block');
        GetElementByIdentifier('video_'+video_index+' .replay').css('display','block');
        GetElementByIdentifier('video_'+video_index+' .equalizer').css('display','block'); 
    }
}

function ResetAllStyles() {
    GetElementByClassName('current').removeAttr('style');
    GetElementByClassName('play').removeAttr('style');
    GetElementByClassName('pause').removeAttr('style');
    GetElementByClassName('replay').removeAttr('style');
    GetElementByClassName('equalizer').removeAttr('style');
}

function ResetCover() {
    GetElementByClassName('current').removeAttr('style');
}


//██╗  ██╗████████╗███╗   ███╗██╗         ██████╗ ██╗   ██╗██╗██╗     ██████╗ ███████╗██████╗ 
//██║  ██║╚══██╔══╝████╗ ████║██║         ██╔══██╗██║   ██║██║██║     ██╔══██╗██╔════╝██╔══██╗
//███████║   ██║   ██╔████╔██║██║         ██████╔╝██║   ██║██║██║     ██║  ██║█████╗  ██████╔╝
//██╔══██║   ██║   ██║╚██╔╝██║██║         ██╔══██╗██║   ██║██║██║     ██║  ██║██╔══╝  ██╔══██╗
//██║  ██║   ██║   ██║ ╚═╝ ██║███████╗    ██████╔╝╚██████╔╝██║███████╗██████╔╝███████╗██║  ██║
//╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝╚══════╝    ╚═════╝  ╚═════╝ ╚═╝╚══════╝╚═════╝ ╚══════╝╚═╝  ╚═╝


function UpdatePlayList(video) {
    VideoIndexInMusicPlayer = VideoIndexInMusicPlayer + 1;
    var infos = GetVideoTitle(video.id);
    $(".video_boxes").append(`<div class="video_box" id="video_${VideoIndexInMusicPlayer}">
            <div class="video_info">
                <div class="delete"><i class="material-icons" onClick="RemoveYoutubeVideo('${video.id}','${VideoIndexInMusicPlayer}')">playlist_remove</i></div>
                <div class="img" style ="background: url(https://img.youtube.com//vi/${video.id}/0.jpg) center center;background-size: cover;"></div>
                <div class="titles">
                    <h5>${infos[0].substring(0, 25)}</h5>
                    <p>${infos[1].substring(0, 25)}</p>
                </div>
            </div>
            <div class="actions">
                <div class="equalizer"><i class="material-icons" style ="color: #F44336;">equalizer</i></div>
                <div class="play"><i class="material-icons" onClick="PlayYoutubeVideo('${video.id}','${VideoIndexInMusicPlayer}')">play_arrow</i></div>
				<div class="pause"><i class="material-icons" onClick="PauseYoutubeVideo('${VideoIndexInMusicPlayer}')">pause</i></div>
				<div class="replay"><i class="material-icons" onClick="ReplayYoutubeVideo('${video.id}','${VideoIndexInMusicPlayer}')">replay</i></div>
            </div>
        </div>`);
    if (video.playing == true) {
        CurrentVideoIndexInMusicPlayer = VideoIndexInMusicPlayer;
        GetElementByIdentifier('video_'+VideoIndexInMusicPlayer+' .play').css('display', video.paused ? 'block' : 'none');
        GetElementByIdentifier('video_'+VideoIndexInMusicPlayer+' .pause').css('display', video.paused ? 'none' : 'block');
        GetElementByIdentifier('video_'+VideoIndexInMusicPlayer+' .replay').css('display','block');
        GetElementByIdentifier('video_'+VideoIndexInMusicPlayer+' .equalizer').css('display','block');  
        UpdateCover(video.id);
    }
    if(video.removed == true) {
        GetElementByIdentifier('video_'+VideoIndexInMusicPlayer).css('display','none');
    }
}


//██╗   ██╗ ██████╗ ██╗   ██╗████████╗██╗   ██╗██████╗ ███████╗    ██╗   ██╗████████╗██╗██╗     ███████╗
//╚██╗ ██╔╝██╔═══██╗██║   ██║╚══██╔══╝██║   ██║██╔══██╗██╔════╝    ██║   ██║╚══██╔══╝██║██║     ██╔════╝
// ╚████╔╝ ██║   ██║██║   ██║   ██║   ██║   ██║██████╔╝█████╗      ██║   ██║   ██║   ██║██║     ███████╗
//  ╚██╔╝  ██║   ██║██║   ██║   ██║   ██║   ██║██╔══██╗██╔══╝      ██║   ██║   ██║   ██║██║     ╚════██║
//   ██║   ╚██████╔╝╚██████╔╝   ██║   ╚██████╔╝██████╔╝███████╗    ╚██████╔╝   ██║   ██║███████╗███████║
//   ╚═╝    ╚═════╝  ╚═════╝    ╚═╝    ╚═════╝ ╚═════╝ ╚══════╝     ╚═════╝    ╚═╝   ╚═╝╚══════╝╚══════╝


function IsValidYouTubeUrl(url) {
    if (url != undefined || url != '') {
        var regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=|\?v=)([^#\&\?]*).*/;
        var match = url.match(regExp);
        if (match && match[2].length == 11) {     
            return true
        }
        return false
    }
}

function GetYoutubeVideoId(url) {
    var video_id = url.split('v=')[1];
    var ampersandPosition = video_id.indexOf('&');
    if(ampersandPosition != -1) {
        video_id = video_id.substring(0, ampersandPosition);
    }
    return video_id
}

function GetVideoTitle(video_id) {
    const apiUrl = `https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=${video_id}&format=json`;
    const xhr = new XMLHttpRequest();
    xhr.open('GET', apiUrl, false);
    xhr.send();
    if (xhr.status === 200) {
        const data = JSON.parse(xhr.responseText);
        return [data.title, data.author_name];
    } else {
        return "Unknown";
    }
}
