require_relative 'civilization'

class BizantineCivilization < Civilization
  def initialize()
    super(
      pikemen_amount: 5,
      bowmen_amount: 8,
      knights_amount: 15
    )
  end
end