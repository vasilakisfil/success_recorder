require 'success_recorder/version'
require 'redis/objects'

module SuccessRecorder
  def self.success!(keys)
    Adapter.new(keys).success
  end

  def self.failure!(keys)
    Adapter.new(keys).failure
  end

  def self.report(keys)
    Adapter.new(keys).report
  end
end

require_relative 'success_recorder/adapter'
