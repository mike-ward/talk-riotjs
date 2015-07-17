import riot from 'riot';
import './itunes-form.tag'; 
import './itunes-list.tag';

<itunes-browser>
  <itunes-form filter="{ filter }" />
  <hr style="margin: 1pc 0;">
  <itunes-list filter="{ filter }" />
  
  <script>
    this.filter = riot.observable();
    this.filter.value = '';
  </script>
</itunes-browser>