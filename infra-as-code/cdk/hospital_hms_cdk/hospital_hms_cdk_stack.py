from aws_cdk import (
    # Duration,
    Stack,
    aws_eks as eks,
    aws_ec2 as ec2
    # aws_sqs as sqs,
)
from aws_cdk.lambda_layer_kubectl_v33 import KubectlV33Layer
from constructs import Construct

class HospitalHmsCdkStack(Stack):

    def __init__(self, scope: Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        # provision a cluster
        cluster = eks.Cluster(self, "hospital-hms-cluster", 
            version=eks.KubernetesVersion.V1_33, 
            kubectl_layer=KubectlV33Layer(self, "kubectl"),
            default_capacity=2,
            default_capacity_instance=ec2.InstanceType.of(ec2.InstanceClass.T2, ec2.InstanceSize.SMALL),
            alb_controller=eks.AlbControllerOptions(version=eks.AlbControllerVersion.V2_8_2)
        )

    
