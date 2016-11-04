class AddAchieves < ActiveRecord::Migration
  def up
  	approach = AchievmentType.create! name: 'approach'
  	date = AchievmentType.create! name: 'date'
  	close = AchievmentType.create! name: 'close'
  	self_a = AchievmentType.create! name: 'self'
  	relationship = AchievmentType.create! name: 'relationship'
  	misc = AchievmentType.create! name: 'misc'

    approach_achievements = [{:detail =>"Compliment someone you find attractive",:points =>"10"},
    {:detail =>"Buy drinks for someone, only to have them leave soon after",:points =>"15"},
    {:detail =>"Buy a drink for a stranger",:points =>"15"},
        {:detail =>"Get a drink bought for you",:points =>"15"},
    {:detail =>"Get a hug from someone new",:points =>"20"},
        {:detail =>"Dress to impress",:points =>"20"},
    {:detail =>"Three achievements in one night",:points =>"25"},
    {:detail =>"Take a selfie with an attractive stranger",:points =>"25"},
    {:detail =>"The person you're flirting with calls you by the wrong name",:points =>"25"},
    {:detail =>"Have an interesting conversation with an attractive individual",:points =>"25"},
    {:detail =>"Get ditched when you think things are going great",:points =>"25"},
    {:detail =>"Get cock blocked",:points =>"25"},
    {:detail =>"Ask a stranger to dance",:points =>"25"},
    {:detail =>"Fail three times when asking someone to dance",:points =>"30"},
    {:detail =>"Get somebody a drink who is alone",:points =>"30"},
    {:detail =>"Start a conversation with someone who is alone",:points =>"30"},
    {:detail =>"Pick up someone using a foreign accent",:points =>"30"},
        {:detail =>"Start a conversation with someone while they are in a group",:points =>"35",},
    {:detail =>"Dance with five different strangers in one night",:points =>"100"},
    {:detail =>"Use this app to pick someone up",:points =>"100"}]
    date_achievements = [
        {:detail =>"Get picked up for a date",:points =>"10"},
    {:detail =>"Pick the other person up for a date",:points =>"15"},
        {:detail =>"Go out for drinks/coffee",:points =>"15"},
    {:detail =>"Go on a hike",:points =>"20"},
    {:detail =>"Go bowling",:points =>"20"},
    {:detail =>"Go to trivia night",:points =>"20"},
    {:detail =>"Play board games",:points =>"20"},
    {:detail =>"Watch a movie",:points =>"20"},
        {:detail =>"Go to a sporting event",:points =>"20"},
        {:detail =>"Go on a picnic",:points =>"20"},
        {:detail =>"Go mini golfing",:points =>"20"},
        {:detail =>"Go hot tubbing",:points =>"20"},
        {:detail =>"Star gaze",:points =>"20"},
        {:detail =>"Go on a nice dinner date",:points =>"20"},
        {:detail =>"Pay for the date",:points =>"20"},
    {:detail =>"Go on a tradtional date (dinner and a movie)",:points =>"25"},
    {:detail =>"Make a special dinner for your date",:points =>"40"},
        {:detail =>"Make dinner together",:points =>"50"},
    {:detail =>"Successfully go on a date with the same person three times",:points =>"100"},
        {:detail =>"Meet their parents",:points =>"125"},
        {:detail =>"Date someone you met on this app longer than a month",:points =>"150"}
  ]
    close_achievements = [
        {:detail =>"Use a vulgar pickup line and fail",:points =>"20"},
        {:detail =>"Use a cheesy pickup line and fail",:points =>"20"},
        {:detail =>"Use a vulgar pickup line and succeed",:points =>"25"},
        {:detail =>"Use a cheesy pickup line and succeed",:points =>"25"},
            {:detail =>"Find out they gave you a fake number",:points =>"25"},
        {:detail =>"Get a kiss from someone new",:points =>"40"},
        {:detail =>"Get or give a real phone number",:points =>"40"},
        {:detail =>"Hook up with a person using a dating app",:points =>"50"},
        {:detail =>"Receive a text from a person you just met",:points =>"50"},
            {:detail =>"Pick up someone else's bar tab",:points =>"50"},
            {:detail =>"Walk someone to their car",:points =>"50"},
        {:detail =>"Become more than friends",:points =>"75"},
        {:detail =>"Receive a phone call from a person you just met",:points =>"75"},
            {:detail =>"Bring someone you just met home",:points =>"100"},
            {:detail =>"Get three different phone numbers in one night",:points =>"100"},
        {:detail =>"Hook up with someone that uses this app",:points =>"300"}
      ]
    self_achievements = [
        {:detail =>"Catch up with someone important to you",:points =>"10"},
        {:detail =>"Make a weekly to-do list",:points =>"15"},
        {:detail =>"Do a task you've been avoiding",:points =>"15"},
    {:detail =>"Read a book",:points =>"15"},
    {:detail =>"Write out a weekly schedule",:points =>"15"},
        {:detail =>"Try a new hobby",:points =>"15"},
    {:detail =>"Do something outside of your comfort zone",:points =>"15"},
    {:detail =>"Write out a budget",:points =>"20"},
        {:detail =>"Write a 3-5 year plan",:points =>"25"},
        {:detail =>"Write out a budget",:points =>"25"},
        {:detail =>"Complete a short course or online seminar (not for a degree)",:points =>"25"},
        {:detail =>"Volunteer unpaid at least one hour",:points =>"25"},
        {:detail =>"Volunteer unpaid 5 hours or more",:points =>"30"},
        {:detail =>"Quit/reduce a bad habit for three weeks",:points =>"30"},
        {:detail =>"Create a good habit for at least three weeks (not exercise)",:points =>"40"},
        {:detail =>"Get a job",:points =>"50"},
        {:detail =>"Get a promotion at work",:points =>"50"},
        {:detail =>"Quit/reduce a bad habit for three months",:points =>"50"},
        {:detail =>"Create a good habit for three months or more",:points =>"125"},
        {:detail =>"Get out of debt",:points =>"150"},
        {:detail =>"Quit a true addiction for three months or more",:points =>"200"},
        {:detail =>"Get licensed for a trade",:points =>"200"},
        {:detail =>"Graduate with a bachelor's degree or more",:points =>"300"}
  ]
    relationship_achievements = [
        {:detail =>"Recieve a gift from your significant other",:points =>"15"},
    {:detail =>"Give a gift to your significant other",:points =>"25"},
    {:detail =>"Go on a double date",:points =>"25"},
    {:detail =>"Set up a single friend",:points =>"30"},
        {:detail =>"Exercise together",:points =>"40"},
        {:detail =>"Go camping",:points =>"40"},
        {:detail =>"In a relationship for 3+ months",:points =>"50"},
        {:detail =>"Give your significant other a massage",:points =>"50"},
        {:detail =>"Talk to your significant other about past relationships",:points =>"50"},
        {:detail =>"Resolve a conflict",:points =>"50"},
        {:detail =>"Talk about a future together",:points =>"75"},
        {:detail =>"Go on a spontaneous overnight trip",:points =>"75"},
        {:detail =>"Finish a Netflix series together",:points =>"75"},
        {:detail =>"Spend a holiday with their family",:points =>"100"},
    {:detail =>"In a relationship 3+ months with somebody you met in the Approach stage",:points =>"200"},
        {:detail =>"In a relationship for 6+ months",:points =>"200"},
        {:detail =>"Move in together",:points =>"300"},
        {:detail =>"In a relationship for 1+ years",:points =>"300"},
        {:detail =>"Go out of the country together",:points =>"300"},
        {:detail =>"Become engaged",:points =>"400"},
        {:detail =>"Become married",:points =>"500"},
        {:detail =>"Become engaged using this app from the Approach stage",:points =>"800"},
        {:detail =>"Become married using this app from the Approach stage",:points =>"900"}
  ]
    misc_achievements = [
    {:detail =>"Close out the bar",:points =>"20"},
    {:detail =>"Go home with someone only to realize you are sleeping on the couch",:points =>"20"},
    {:detail =>"Successfully get someone else to download this app",:points =>"20"},
    {:detail =>"Dance on a table in public",:points =>"20"},
        {:detail =>"Dance even when no one else is",:points =>"20"},
    {:detail =>"Back your friend up",:points =>"25"},
    {:detail =>"Call your friend out for not attempting any achievements all night",:points =>"25"},
    {:detail =>"Too much PDA for one room",:points =>"25"},
    {:detail =>"Walk home from a bar or party",:points =>"25"},
    {:detail =>"Ditch responsibilities and go out with friends",:points =>"30"},
    {:detail =>"Stand up and announce you are sexy(loudly)",:points =>"30"},
    {:detail =>"Go to 5 different bars in one night",:points =>"30"},
    {:detail =>"Get a taxi ride home",:points =>"50"},
    {:detail =>"Buy five people a drink in one night",:points =>"50"},
    {:detail =>"Be the DD for a night",:points =>"75"},
    {:detail =>"Successfully wingman five times",:points =>"100"},
    {:detail =>"Buy everyone in the bar a drink",:points =>"100"},
    {:detail =>"Successfully get 10 people to download this app",:points =>"100"},
    {:detail =>"Successfully wingman ten times",:points =>"200"}
  ]

    approach_achievements.each do |a|
    	Achievement.create(description: a[:detail], points: a[:points], achievement_id: approach.id)
    end

    date_achievements.each do |a|
    	Achievement.create(description: a[:detail], points: a[:points], achievement_id: date.id)
    end

    close_achievements.each do |a|
    	Achievement.create(description: a[:detail], points: a[:points], achievement_id: close.id)
    end

    self_achievements.each do |a|
    	Achievement.create(description: a[:detail], points: a[:points], achievement_id: self_a.id)
    end

    relationship_achievements.each do |a|
    	Achievement.create(description: a[:detail], points: a[:points], achievement_id: relationship.id)
    end

    misc_achievements.each do |a|
    	Achievement.create(description: a[:detail], points: a[:points], achievement_id: misc.id)
    end
  end

  def down

  end
end
