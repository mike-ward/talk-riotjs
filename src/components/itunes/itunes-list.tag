<itunes-list>
  <table show="{mediaItems.resultCount}" class="pure-table pure-table-striped">
    <thead>
      <tr>
        <th></th>
        <th>Cover</th>
        <th>Track</th>
        <th>Type</th>
        <th>Artist</th>
        <th>Collection</th>
        <th>Track</th>
        <th>Collection</th>
      </tr>
    </thead>
    <tbody>
      <tr each="{mediaItems.results}">
        <td><button click="playVideo(media)" class="pure-button"><i class="icon-play"></i></button></td>
        <td><a href="{previewUrl}" target="_blank"><img src="{artworkUrl60}" /></a></td>
        <td>{trackName || collectionName}</td>
        <td>{kind}</td>
        <td>{artistName}</td>
        <td>{collectionName}</td>
        <td>{trackPrice}</td>
        <td>{collectionPrice}</td>
      </tr>
    </tbody>
  </table>
  
  <script>
    this.mediaItems = [];
    
    riot.control.on(riot.EVT.queryITunesStoreSuccess, items => {
      this.mediaItems = items;
      this.update();
    });
  </script>
</itunes-list>