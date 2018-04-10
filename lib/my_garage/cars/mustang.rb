module MyGarage
  class Camaro < BaseCar
    def initialize(hsh = {})
      default_hsh = {brand: 'Ford', color: 'Lightning Blue', max_speed: 160}
      init_hsh = default_hsh.merge(hsh)
      super(init_hsh)
    end
  end
end
