class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :films
  has_many :reviews
  has_many :film_relationships
  has_many :marked_films, :through => :film_relationships, :source => :film

  def is_member_of?(film)
    marked_films.include?(film)
  end

  def join!(film)
    marked_films << film
  end

  def quit!(film)
    marked_films.delete(film)
  end

end
