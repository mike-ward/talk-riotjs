import riot from 'riot'
import './pages/home.tag'
import './pages/projects.tag'
import './pages/itunes.tag'

// we need this to easily check the current route from every component 
riot.routeState = {
  view: ''
};

class Router {
  constructor() {
    this._currentView = null;
    this._views = ['home', 'projects', 'itunes'];
    this._defaultView = 'home';

    riot.route(this._handleRoute.bind(this));
    riot.route.exec(this._handleRoute.bind(this));
  }

  _handleRoute(view) {
      if (this._views.indexOf(view) === -1) return riot.route(this._defaultView);
    this._loadView(view);
  }

  _loadView(view) {
    if (this._currentView) this._currentView.unmount(true);
    riot.routeState.view = view;
    this._currentView = riot.mount('#riot-app', view)[0];
  }
}

export default new Router();