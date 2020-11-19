/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module */
/*! CommonJS bailout: module.exports is used directly at 56:0-14 */
/***/ ((module) => {

class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data('user-id'); 
    this.followState = this.$el.data('initial-follow-state');
    this.render();
    this.$el.on('click', this.handleClick.bind(this));
  }
  
  render(){
      // if(this.followState === 'unfollowed'){
      //   this.$el.html('Follow!');
      // } else {
      //   this.$el.html('Unfollow!');
      // }
      switch(this.followState){
        case "followed":
          this.$el.html('Unfollow!');
          break;
        case "unfollowed":
          this.$el.html("Follow!");
          break;
      }
  }

  handleClick(event) {
    const followToggle = this;

    event.preventDefault();

    if (this.followState === 'unfollowed') {
        $.ajax({
          url:`/users/${this.userId}/follow`,
          method: 'POST',
          dataType: 'json'
        }).then(res => {
            followToggle.followState = "followed";
            followToggle.render();
        });
    } else if (this.followState === 'followed') {
        $.ajax({
          url:`/users/${this.userId}/follow`,
          method: 'DELETE',
          dataType: 'json'
        }).then(res => {
            followToggle.followState = "unfollowed";
            followToggle.render();
        });
    } 
  }
}




module.exports = FollowToggle;

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: __webpack_require__ */
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

$(function(){
    $('button.follow-toggle').each( (i, btn) => new FollowToggle(btn));
});
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map