import boto3

def lambda_handler(event, context):
    ec2 = boto3.client('ec2')

    instances = [
        instance['InstanceId']
        for reservation in ec2.describe_instances()['Reservations']
        for instance in reservation['Instances']
    ]

    if instances:
        ec2.stop_instances(InstanceIds=instances)
        return {"status": "success", "stopped_instances": instances}
    
    return {"status": "no_instances"}