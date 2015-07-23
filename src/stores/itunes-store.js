import riot from 'riot';
import jsonp from 'browser-jsonp';

(function () {
  var iTunesStore = riot.observable();

  iTunesStore.on(riot.EVT.queryITunesStore, (term, media) => {
    jsonp({
      url: 'https://itunes.apple.com/search',
      data: { term: term, media: media },
      success: data => iTunesStore.trigger(riot.EVT.queryITunesStoreSuccess, data),
      error: err => alert(err)
    });
  });

  riot.control.addStore(iTunesStore);
})();
