module MyGarage
  class Camaro < BaseCar
    def initialize(hsh = {})
      default_hsh = {brand: 'Chevy', color: 'Red Hot', max_speed: 200}
      init_hsh = default_hsh.merge(hsh)
      super(init_hsh)
    end
  end
end
