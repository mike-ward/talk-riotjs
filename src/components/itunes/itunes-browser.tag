import riot from 'riot';
import './itunes-form.tag'; 
import './itunes-list.tag';

<itunes-browser>
  <itunes-form filters="{filters}" />
  <hr style="margin: 1pc 0;">
  <itunes-list filters="{filters}" track="{track}" />
  <itunes-player media="{track}" />

  <script>
    this.filters = riot.observable();
    this.track = riot.observable();
  </script>
</itunes-browser>