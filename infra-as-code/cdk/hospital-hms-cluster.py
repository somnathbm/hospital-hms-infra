from aws_cdk.lambda_layer_kubectl_v33 import KubectlV33Layer


eks.Cluster(self, "hospital-hms-cluster",
    version=eks.KubernetesVersion.V1_33,
    default_capacity=2,
    default_capacity_instance=ec2.InstanceType.of(ec2.InstanceClass.T2A, ec2.InstanceSize.SMALL),
    kubectl_layer=KubectlV33Layer(self, "kubectl")
)