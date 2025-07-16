import aws_cdk as core
import aws_cdk.assertions as assertions

from hospital_hms_cdk.hospital_hms_cdk_stack import HospitalHmsCdkStack

# example tests. To run these tests, uncomment this file along with the example
# resource in hospital_hms_cdk/hospital_hms_cdk_stack.py
def test_sqs_queue_created():
    app = core.App()
    stack = HospitalHmsCdkStack(app, "hospital-hms-cdk")
    template = assertions.Template.from_stack(stack)

#     template.has_resource_properties("AWS::SQS::Queue", {
#         "VisibilityTimeout": 300
#     })
