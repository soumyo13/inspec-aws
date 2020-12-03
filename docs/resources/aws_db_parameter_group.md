---
title: About the aws_db_parameter_group Resource
platform: aws
---

# aws\_db\_parameter_\_group

Use the `aws_db_parameter_group` InSpec audit resource to test properties of a db parameter group.

## Syntax

 An `aws_db_parameter_group` resource block uses the parameter to select a parameter group.

    describe aws_db_parameter_group(db_parameter_group_name: 'parameter-group-name-12345') do
      it { should exist }
    end


#### Parameters

##### db\_parameter\_group\_name _(required)_

This resource accepts a single parameter, the DB parameter Group Name.
This can be passed either as a string or as a `aws_db_parameter_group: 'value'` key-value entry in a hash.

See also the [AWS documentation on DB Parameter Groups](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_VPC.WorkingWithRDSInstanceinaVPC.html#USER_VPC.Parameters).


## Properties

|Property                     | Description|
| ---                         | --- |
|db\_parameter\_group\_name    | The name of the DB parameter group. |
|db\_parameter\_group\_family   | The name of the DB parameter group family that this DB parameter group is compatible with. |
|description    | Provides the customer-specified description for this DB parameter group. |
|db\_parameter\_group\_arn    | The Amazon Resource Name (ARN) for the DB parameter group. |

For a comprehensive list of properties available, see [the API reference documentation](https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_DBParameterGroup.html)

## Examples

##### Check DB Parameter Group Name of a parameter group

    describe aws_db_parameter_group(db_parameter_group_name: 'parameter-group-name-12345') do
      its('db_parameter_group_name')  { should eq 'parameter-group-name-12345' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

#### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_db_parameter_group(db_parameter_group_name: 'parameter-group-name-12345') do
      it { should exist }
    end

    describe aws_rds_cluster(db_cluster_identifier: 'parameter-group-name-6789') do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `rds:DescribeDBparameterGroup` action with Effect set to Allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon RDS](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonrds.html).