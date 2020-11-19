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