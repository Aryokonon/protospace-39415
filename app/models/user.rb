class User < ApplicationRecord
  has_many :prototypes, dependent: :destroy
  has_many :comments, dependent: :destroy


  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # My validations
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true

  # Additional custom validations
  validate :custom_validation_method

  private

  def custom_validation_method
    # Add your custom validation logic here
    # You can use the `errors` object to add validation errors if needed
  end
end