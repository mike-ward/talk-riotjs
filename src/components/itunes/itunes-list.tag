import riot from 'riot'
import "./itunes-video-player.tag"

<itunes-list>
  <table show="{mediaItems.resultCount}" class="pure-table">
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
      <tr each="{filterResults(mediaItems)}">
        <td><button onclick="{playVideo}" class="pure-button">►</i></button></td>
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
  
  <itunes-video-player media="{preview}" />

  <script>
    this.mediaItems = [];
    
    this.opts.sortby.on('changed', () => this.update());  
    this.opts.filterby.on('changed', () => this.update());  
    riot.control.on(riot.EVT.queryITunesStoreSuccess, items => this.update({mediaItems: items}));
    
    this.filterResults = items => { 
      let filterOn = f => fb => r => r[f].toLowerCase().indexOf(fb) !== -1;
      let sortOn = f => (l, r) => l[f] ? l[f].localeCompare(r[f]) : 0; 
      
      return items
        .results
        .filter(filterOn('artistName')(this.opts.filterby.value.toLowerCase()))
        .sort(sortOn(this.opts.sortby.value)); 
      }

    this.preview = riot.observable();
    this.preview.value = '';
      
    this.playVideo = e => {
      this.preview.value = e.item;
      this.preview.trigger('changed');
      }
  </script>
</itunes-list>