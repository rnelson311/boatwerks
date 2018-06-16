class Boat < ApplicationRecord

  BOAT_TYPES    = %w(power sail)
  CONFIGURATION = %w(ketch sloop yawl trawler sedan cabin cutty other)
  CONSTRUCTION  = %w(fiberglass wood cement steel other)
  FUEL_TYPE     = %w(gas diesel biodiesel other)
  PROPULSION    = %w(inboard outboard sterndrive other)
  belongs_to :client
  belongs_to :marina
end
