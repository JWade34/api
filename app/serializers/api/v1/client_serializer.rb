class Api::V1::ClientSerializer < Api::V1::BaseSerializer

  attributes :id,
             :uuid,
             :name,
             :address,
             :address2,
             :city,
             :state,
             :zip,
             :country,
             :phone,
             :website,
             :created_at
end
