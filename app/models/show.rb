class Show < ActiveRecord::Base

    # .highest_rating
    # returns the rating of the TV show with the highest rating (FAILED - 1)
    def self.highest_rating
        self.maximum(:rating)
    end 

    # .most_popular_show
    # returns the name of the TV show with the highest rating (FAILED - 2)
    # THIS WORKS TOO self.find_by_sql("SELECT * FROM shows WHERE rating = 10 LIMIT 1").first

    def self.most_popular_show
        self.where("rating = ?", self.highest_rating).first
    end 

    # .lowest_rating
    # returns the rating of the TV show with the lowest rating (FAILED - 3)
    def self.lowest_rating
        self.minimum(:rating)
    end
    
    # .least_popular_show
    # returns the name of the TV show with the lowest rating (FAILED - 4)
    def self.least_popular_show
        self.where("rating = ?", self.lowest_rating).first
    end

    # .ratings_sum
    # returns the sum of all the ratings of all the tv shows (FAILED - 5)
    def self.ratings_sum
        self.sum(:rating)
    end

    # .popular_shows
    # returns an array of all of the shows with a rating above 5 (FAILED - 6)
    def self.popular_shows
        self.where("rating > 5", self.all)
    end 

    # .shows_by_alphabetical_order
    # returns an array of all of the shows, listed in alphabetical order (FAILED - 7)
    def self.shows_by_alphabetical_order
        self.all.order("name ASC")
    end
end

