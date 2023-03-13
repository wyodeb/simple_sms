RequestParamsValidation.define do
  phone_format = {regexp:  /^\s*\+?\s*([0-9][\s-]*){6,16}$/,
                  message: 'Should be a phone number'}

  action :inbound do
    request do
      required :from, type: :string, format: phone_format
      required :to, type: :string, format: phone_format
      required :text, type: :string, length: {min: 1, max: 120}
    end
  end

  action :outbound do
    request do
      required :from, type: :string, format: phone_format
      required :to, type: :string, format: phone_format
      required :text, type: :string, length: {min: 1, max: 120}
    end
  end
end
