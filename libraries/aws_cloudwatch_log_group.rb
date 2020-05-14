# frozen_string_literal: true

require 'aws_backend'

class AwsCloudWatchLogGroup < AwsResourceBase
  name 'aws_cloudwatch_log_group'
  desc 'Verifies settings for an AWS CloudWatch Log Group'

  attr_reader :log_group_name, :retention_in_days, :kms_key_id

  def initialize(opts = {})
    super(opts)
    validate_parameters(required: [:log_group_name])

    @log_group_name = opts[:log_group_name]

    catch_aws_errors do
      resp = @aws.cloudwatch_client.describe_log_groups({log_group_name_prefix: @log_group_name})
      @log_groups = resp.log_groups
    end

    return false if @log_groups.empty?

    raise "Found multiple CloudWatch Log Groups. The following matched: #{@log_groups.join(', ')}.  Try to restrict your resource criteria." if @log_groups.count > 1

    @retention_in_days = @log_groups.first.retention_in_days
    @kms_key_id = @log_groups.first.kms_key_id
  end

  def exists?
    !@log_groups.empty?
  end

  def to_s
    "CloudWatch Log Group #{@log_group_name}"
  end
end