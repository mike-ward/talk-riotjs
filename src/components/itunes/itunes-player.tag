import riot from 'riot'

<itunes-player>
  <style>
    itunes-player .popupPlayer { z-index: 10; position: fixed; top: 50%; left: 50%; 
      margin-left: -160px; margin-top: -150px; width: 360px; border: solid 1px #bbb; 
      padding: 20px; background-color: white; }
  </style>
  
  <div class="popupPlayer" show="{media}">
    <div>
      <button onclick="{close}" class="pure-button pure-button-xsmall pull-right">x</button>
      <div>{media.trackName}</div>
      <small>by&nbsp;<cite>{media.artistName}</cite></small>
    </div>
    <video name="player" type="video/mp4" width="320px" height="240px">
  </div>
  
  <script>
    this.media = null;
    
    this.opts.media.on('changed', media => {
      this.close();
      this.media = media;
      this.play(this.media && this.media.previewUrl);
      this.update();
    })
    
    this.play = src => {
        this.player.src = src;
        this.player.load();
        this.player.play();
    }
    
    this.close = e => {
        this.player.pause();
        this.media = null;
    }
  </script>
</itunes-player>