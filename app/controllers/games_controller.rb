require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
    @letters
  end

  # def valid_word
  #   @word.chars.sort.all? { |letter| @grid.include?(letter) }
  # end

  def valid_word
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    valid = JSON.parse(URI.open(url).read)
    return valid['found']
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    # if valid_word == true
    #   @result = 'winner'
    # else
    #   @result = 'looser'
    # end
  end
end
