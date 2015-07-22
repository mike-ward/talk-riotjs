import riot from 'riot';
import './itunes-form.tag'; 
import './itunes-list.tag';

<itunes-browser>
  <itunes-form filters="{filters}" />
  <hr style="margin: 1pc 0;">
  <itunes-list filters="{filters}" />
  
  <script>
    this.filters = riot.observable();
  </script>
</itunes-browser>