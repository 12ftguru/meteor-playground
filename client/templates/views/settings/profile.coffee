Template.settings_profile.helpers
  thing_count: () ->
    return Things.find(created_by: Meteor.userId()).count().toLocaleString()
  friend_count: () ->
    return Utils.randomNumber(0, 250).toLocaleString()
  follower_count: () ->
    return Utils.randomNumber(0, 5000000).toLocaleString()
  profile_completion: () ->
    done = 100
    done -= 20 unless this.profile?.firstName?
    done -= 20 unless this.profile?.lastName?
    done -= 10 unless this.profile?.birthday?
    done -= 10 unless this.profile?.gender?
    done -= 20 unless this.profile?.website?
    done -= 20 unless this.profile?.bio?

    return done

SubR(Template.settings_profile,['my_things'])
