class SuccessRecorder::Adapter
  attr_reader :key, :opts

  def initialize(*args)
    @key, @opts = normalize_params(args)
  end

  def success
    increase_sucesses(key)
    increase_total(key)
  end

  def failure
    increase_total(key)
  end

  def report
    data = Redis::HashKey.new(key).all
    data['successes'].to_f / data['total'].to_f
  end

  private
    def increase_sucesses(key)
      Redis::HashKey.new(key).incr('successes', 1)
    end

    def increase_total(key)
      Redis::HashKey.new(key).incr('total', 1)
    end

    def normalize_params(keys)
      opts = {}; key = nil

      keys.each do |k|
        if k.is_a? Hash
          opts = k
        else
          if key.nil?
            key = k
          else
            key = [key, k].join(':')
          end
        end
      end

      return key, opts
    end
end
