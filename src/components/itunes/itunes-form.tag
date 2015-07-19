<itunes-form>
  <form class="pure-form">
    <label>Search for</label>
    <input name="artist" type="text" placeholder="Required" class="pure-input-rounded" required>
    
    <label>Media Type</label>
    <select name="media" onchange="{onSelectMedia}">
      <option value="all" selected>All</option>
      <option value="musicVideo">Video</option>
      <option value="movie">Movie</option>
      <option value="music">Music</option>
      <option value="podcast">Podcast</option>
      <option value="tvShow">TV Show</option>
    </select>
    
    <button 
      class="pure-button pure-button-primary" 
      onclick="{ onSearch }">Search</button>
      
    <span class="pull-right">
      <label>Sort by</label>
      <select name="sortBy" onchange="{onSortbyChanged}">
        <option value="artistName">Artist</option>
        <option value="trackName">Track</option>
        <option value="collectionName">Collection</option>
        <option value="kind">Type</option>
      </select>
      
      <label>Filter by</label>
      <input type="text" value="{ opts.filterby.value }" oninput="{ onFilterbyChange }">
    </span>
  </form>
  
  <script>
    this.onSearch = () => riot.control.trigger(riot.EVT.queryITunesStore, this.artist.value, this.media.value);
    this.onSelectMedia = e => this.opts.media.value = e.target.value;
    
    this.onFilterbyChange = e => {
      this.opts.filterby.value = e.target.value;
      this.opts.filterby.trigger('changed');
    }
      
    this.onSortbyChanged = e => {
      this.opts.sortby.value = e.target.value;
      this.opts.sortby.trigger('changed');
    }
  </script>
</itunes-form>