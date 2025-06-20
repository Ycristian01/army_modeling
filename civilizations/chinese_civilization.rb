require_relative 'civilization'

class ChineseCivilization < Civilization
  def initialize()
    super(
      pikemen_amount: 2,
      bowmen_amount: 25,
      knights_amount: 2
    )
  end
end