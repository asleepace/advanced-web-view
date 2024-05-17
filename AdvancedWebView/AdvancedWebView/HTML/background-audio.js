//const videos = document.getElementsByTagName('video');

function addListenerMulti(el, s, fn) {
    s.split(' ').forEach(e => el.addEventListener(e, fn, false));
}

var video = document.getElementById('player');

addListenerMulti(video, 'abort canplay canplaythrough durationchange emptied encrypted ended error interruptbegin interruptend loadeddata loadedmetadata loadstart mozaudioavailable pause play playing progress ratechange seeked seeking stalled suspend timeupdate volumechange waiting', function(e){
    console.log(e.type);
});

video.pause = function() {
    console.log('[js] overrode pause!');
    video.play();
}

//for (let i = 0; i < videos.length; i++) {
//    const video = videos[i];
//    
//    video.pause = function() {
//        console.log('[pause] disabled!');
//    }
//
//  video.addEventListener('visibilitychange', (event) => {
//    console.log('[visibilitychange] change:', event);
//    if (video.paused) {
//      console.log('[visibilitychange] un-pausing video...')
//      video.play();
//    }
//  });
//
//  video.onpause = () => {
//    console.log('[onpause] un-pausing video...')
//    // video.play();
//  }
//}
