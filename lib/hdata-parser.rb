require 'rubygems'
require 'open-uri'
require 'roxml'

require File.expand_path(File.dirname(__FILE__) + '/duck_punches/roxml')

require File.expand_path(File.dirname(__FILE__) + '/models/core_data_types/actor/actor_management')
require File.expand_path(File.dirname(__FILE__) + '/models/core_data_types/xml_base')
require File.expand_path(File.dirname(__FILE__) + '/models/core_data_types/address')
require File.expand_path(File.dirname(__FILE__) + '/models/core_data_types/coded_value')
require File.expand_path(File.dirname(__FILE__) + '/models/core_data_types/core_date')
require File.expand_path(File.dirname(__FILE__) + '/models/core_data_types/date_range')
require File.expand_path(File.dirname(__FILE__) + '/models/core_data_types/description')
require File.expand_path(File.dirname(__FILE__) + '/models/core_data_types/name')
require File.expand_path(File.dirname(__FILE__) + '/models/core_data_types/telecom')
require File.expand_path(File.dirname(__FILE__) + '/models/core_data_types/person')
require File.expand_path(File.dirname(__FILE__) + '/models/core_data_types/organization')
require File.expand_path(File.dirname(__FILE__) + '/models/core_data_types/actor')
require File.expand_path(File.dirname(__FILE__) + '/models/core_data_types/information_source')

require File.expand_path(File.dirname(__FILE__) + '/models/condition/treating_provider')

require File.expand_path(File.dirname(__FILE__) + '/models/feed_core/link')
require File.expand_path(File.dirname(__FILE__) + '/models/feed_core/feed_author')
require File.expand_path(File.dirname(__FILE__) + '/models/feed_core/entry')

require File.expand_path(File.dirname(__FILE__) + '/models/immunization/material')
require File.expand_path(File.dirname(__FILE__) + '/models/immunization/immunization_product')

require File.expand_path(File.dirname(__FILE__) + '/models/insurance_provider/guarantor')
require File.expand_path(File.dirname(__FILE__) + '/models/insurance_provider/insurance_provider_patient')
require File.expand_path(File.dirname(__FILE__) + '/models/insurance_provider/payer')
require File.expand_path(File.dirname(__FILE__) + '/models/insurance_provider/subscriber')

require File.expand_path(File.dirname(__FILE__) + '/models/medication/medication_product')
require File.expand_path(File.dirname(__FILE__) + '/models/medication/order_information')
require File.expand_path(File.dirname(__FILE__) + '/models/medication/perscription')

require File.expand_path(File.dirname(__FILE__) + '/models/patient/birth_place')
require File.expand_path(File.dirname(__FILE__) + '/models/patient/language')

require File.expand_path(File.dirname(__FILE__) + '/models/result/value')
require File.expand_path(File.dirname(__FILE__) + '/models/result/unit_value')
require File.expand_path(File.dirname(__FILE__) + '/models/result/bp')

require File.expand_path(File.dirname(__FILE__) + '/models/root/extension')
require File.expand_path(File.dirname(__FILE__) + '/models/root/section')

require File.expand_path(File.dirname(__FILE__) + '/models/advance_directive')
require File.expand_path(File.dirname(__FILE__) + '/models/allergy')
require File.expand_path(File.dirname(__FILE__) + '/models/comment')
require File.expand_path(File.dirname(__FILE__) + '/models/condition')
require File.expand_path(File.dirname(__FILE__) + '/models/encounter')
require File.expand_path(File.dirname(__FILE__) + '/models/feed')
require File.expand_path(File.dirname(__FILE__) + '/models/healthcare_provider')
require File.expand_path(File.dirname(__FILE__) + '/models/immunization')
require File.expand_path(File.dirname(__FILE__) + '/models/insurance_provider')
require File.expand_path(File.dirname(__FILE__) + '/models/medication')
require File.expand_path(File.dirname(__FILE__) + '/models/patient')
require File.expand_path(File.dirname(__FILE__) + '/models/procedure')
require File.expand_path(File.dirname(__FILE__) + '/models/result')
require File.expand_path(File.dirname(__FILE__) + '/models/root')
require File.expand_path(File.dirname(__FILE__) + '/models/support')

require File.expand_path(File.dirname(__FILE__) + '/core/hdata')