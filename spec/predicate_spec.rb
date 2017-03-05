require 'spec_helper'

describe Node do

  let (:pred_string) { '<SimplePredicate field="f33" operator="lessOrEqual" value="18.8513846048894"/>' }
  let (:pred_xml) { Nokogiri::XML(pred_string); }
  let (:predicate) { Node.new(pred_xml) }

  it 'logs missing feature' do
    expect(RandomForester.logger).to receive(:error).with('Missing feature f33')
    predicate.true?({})
  end

  it 'logs nil feature' do
    expect(RandomForester.logger).to receive(:error).with('Feature f33 value is nil')
    predicate.true?({f33: nil})
  end

end