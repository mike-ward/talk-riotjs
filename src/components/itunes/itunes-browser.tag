import riot from 'riot';
import './itunes-form.tag'; 
import './itunes-list.tag';

<itunes-browser>
  <itunes-form filterby="{ filterBy }" sortby="{ sortBy }" />
  
  <hr style="margin: 1pc 0;">
  
  <itunes-list filterby="{ filterBy }" sortby="{ sortBy }" />
  
  <script>
    this.filterBy = riot.observable();
    this.filterBy.value = '';
    
    this.sortBy = riot.observable();
    this.sortBy.value = '';
  </script>
</itunes-browser>