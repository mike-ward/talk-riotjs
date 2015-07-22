import riot from 'riot';
import "./itunes-player.tag";

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
        <td><button onclick="{play}" class="pure-button">►</i></button></td>
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
  
  <itunes-player media="{track}" />

  <script>
    this.mediaItems = [];
    this.filterby = '';
    this.sortby = 'artistName';
    
    this.opts.filters.on('changed', (fb, sb) => this.update({filterby: fb, sortby: sb}));
    riot.control.on(riot.EVT.queryITunesStoreSuccess, items => this.update({mediaItems: items}));
    
    this.filterResults = items => { 
      let filterOn = field => text => r => r[field] && r[field].toLowerCase().indexOf(text) !== -1;
      let sortOn = field => (l, r) => l[field] ? l[field].localeCompare(r[field]) : 0; 
      
      return items
        .results
        .filter(filterOn(this.sortby)(this.filterby.toLowerCase()))
        .sort(sortOn(this.sortby)); 
      }

    this.track = riot.observable();
    this.play = e => this.track.trigger('changed', e.item);
  </script>
</itunes-list>