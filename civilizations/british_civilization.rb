require_relative 'civilization'

class BritishCivilization < Civilization
  def initialize()
    super(
      pikemen_amount: 10,
      bowmen_amount: 10,
      knights_amount: 10
    )
  end
end