<itunes-form>
  <form class="pure-form">
    <label>Search for</label>
    <input name="artist" type="text" class="pure-input-rounded">
    
    <label>Media Type</label>
    <select name="media">
      <option value="all" selected>All</option>
      <option value="musicVideo" selected>Video</option>
      <option value="movie">Movie</option>
      <option value="musicTrack">Music</option>
      <option value="podcast">Podcast</option>
      <option value="tvShow">TV Show</option>
    </select>
    
    <button 
      class="pure-button pure-button-primary" 
      onclick="{ onSearch }">Search</button>
      
    <span class="pull-right">
      <label>Sort by</label>
      <select ng-model="sortProp">
        <option value="artistName">Artist</option>
        <option value="collectionName">Collection Name</option>
        <option value="wrapperType">Media Item Name</option>
        <option value="kind" selected>Media Type</option>
      </select>
      
      <label>Filter by</label>
      <input type="text">
    </span>
  </form>
  
  <script>
    this.onSearch = () => riot.control.trigger(riot.EVT.queryITunesStore, this.artist.value, this.media.value);
  </script>
</itunes-form>