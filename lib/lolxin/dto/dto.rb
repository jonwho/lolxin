module Lolxin
  module Dto
    def initialize_with(data)
      data.each do |k, v|
        if v.is_a?(Array)
          # for each value in array check if nested array/hash
          v.each do |el|
            if el.is_a?(Hash)
              dto = Object.const_get(dto_name(k)).send(:new, v)
              set(k, dto)
            else
              set(k, el)
            end
          end
        elsif v.is_a?(Hash)
          dto = Object.const_get(dto_name(k)).send(:new, v)
          set(k, dto)
        else
          set(instance_var, v)
        end
      end
    end

    private

    def set(k, v)
      instance_variable_set(instance_var(k), v)
    end

    def instance_var(s)
      "@#{snake_case(s)}".to_sym
    end

    def snake_case(s)
      s.split(/(?=[A-Z])/).map(&:downcase).join('_')
    end

    def dto_name(s)

    end
  end
end
