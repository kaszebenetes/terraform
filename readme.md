# Terraform

1. block terraform
2. provider config


## Usage

```
terraform init

(if not credentials provided, first auth to cloud provider (az login))
terraform plan

terraform apply

terraform destroy

terraform validate

terraform fmt -recursive .

ansible-playbook -i inventories/inventory-azure.yaml playbook-azure.yaml
```


## Azure Function

os_type             = "Linux"
sku_name            = "Y1"

powershell_core_version = "7.2"

### Info

func azure functionapp publish kaszebe-function-app2

docker run -i -t --rm mcr.microsoft.io/azure-cli


lsb_release -a
 Distributor ID:	Debian
 Description:	Debian GNU/Linux 11 (bullseye)
 Release:	11
 Codename:	bullsey

free -m
                total        used        free      shared  buff/cache   available
 Mem:            2088         486        1203           0         398        1466
 Swap:              0           0           0

/proc/cpuinfo

processor	: 0 vendor_id	: AuthenticAMD cpu family	: 25 model		: 1 model name	: AMD EPYC 7763 64-Core Processor stepping	: 1 microcode	: 0xffffffff cpu MHz		: 2445.434 cache size	: 512 KB physical id	: 0 siblings	: 2 core id		: 0 cpu cores	: 1 apicid		: 0 initial apicid	: 0 fpu		: yes fpu_exception	: yes cpuid level	: 13 wp		: yes flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl tsc_reliable nonstop_tsc cpuid extd_apicid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm cmp_legacy cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw topoext invpcid_single vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves clzero xsaveerptr arat umip vaes vpclmulqdq rdpid fsrm bugs		: sysret_ss_attrs null_seg spectre_v1 spectre_v2 spec_store_bypass bogomips	: 4890.86 TLB size	: 2560 4K pages clflush size	: 64 cache_alignment	: 64 address sizes	: 48 bits physical, 48 bits virtual power management:
processor	: 1 vendor_id	: AuthenticAMD cpu family	: 25 model		: 1 model name	: AMD EPYC 7763 64-Core Processor stepping	: 1 microcode	: 0xffffffff cpu MHz		: 2445.434 cache size	: 512 KB physical id	: 0 siblings	: 2 core id		: 0 cpu cores	: 1 apicid		: 1 initial apicid	: 1 fpu		: yes fpu_exception	: yes cpuid level	: 13 wp		: yes flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl tsc_reliable nonstop_tsc cpuid extd_apicid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm cmp_legacy cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw topoext invpcid_single vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves clzero xsaveerptr arat umip vaes vpclmulqdq rdpid fsrm bugs		: sysret_ss_attrs null_seg spectre_v1 spectre_v2 spec_store_bypass bogomips	: 4890.86 TLB size	: 2560 4K pages clflush size	: 64 cache_alignment	: 64 address sizes	: 48 bits physical, 48 bits virtual power management:

id
uid=1000(app) gid=1000(app) groups=1000(app)

df -h
Filesystem                                                         Size  Used Avail Use% Mounted on
overlay                                                             50G  500K   47G   1% /
tmpfs                                                               64M     0   64M   0% /dev
shm                                                                 64M  8.0K   64M   1% /dev/shm
/dev/sdc                                                            50G  500K   47G   1% /etc/hosts
tmpfs                                                              1.1G     0  1.1G   0% /sys/fs/cgroup
//{{ storage_account_samba }}/                                     100T   64K  100T   1% /home
fuse-zip                                                            47G     0   47G   0% /home/site/wwwroot

//kaszebefuncst1.file.core.windows.net/kaszebe-function-app2-905a

UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 22:59 ?        00:00:00 /pause
root        14     0  0 22:59 ?        00:00:00 /bin/bash /root/mesh/launch.sh
root        20     0  0 22:59 ?        00:00:00 tail -f /dev/null
root        25    14  0 22:59 ?        00:00:00 /root/mesh/init
root        36     1  0 22:59 ?        00:00:00 nginx: master process nginx
root        39     0  0 22:59 ?        00:00:00 /bin/sh ./LinuxConsumptionStartup.sh LinuxConsumption
root        43    14  0 22:59 ?        00:00:00 /bin/sh /root/mesh/run.sh
root        52    43  0 22:59 ?        00:00:00 sudo -Eu app /azure-functions-host/Microsoft.Azure.WebJobs.Script.WebHost
root        55    39  0 22:59 ?        00:00:00 /bin/sh ./Startup.sh LinuxConsumption
root        59    55  0 22:59 ?        00:00:01 dotnet Microsoft.Azure.AppService.TokenService.dll LinuxConsumption
app         60    52  1 22:59 ?        00:00:04 /azure-functions-host/Microsoft.Azure.WebJobs.Script.WebHost
app        244    36  0 23:02 ?        00:00:00 nginx: worker process
root       250     1  0 23:02 ?        00:00:00 fuse-zip -ononempty,allow_other,uid=1000,gid=1000 /tmp/20240807230207-22197ddf-2df8-4be8-9df5-8885cd492fa5.zip /home/site/wwwroot
app        251    60  2 23:02 ?        00:00:03 dotnet /azure-functions-host/workers/powershell/7.2/Microsoft.Azure.Functions.PowerShellWorker.dll --host 127.0.0.1 --port 33521 --workerId 8773a164-fcbc-4dfe-ad1f-a5cd42c9b097 --requestId 1b9eadd5-f6c8-4cd4-8e6c-2facea965d3a --grpcMaxMessageLength 2147483647 --functions-uri http://127.0.0.1:33521/ --functions-worker-id 8773a164-fcbc-4dfe-ad1f-a5cd42c9b097 --functions-request-id 1b9eadd5-f6c8-4cd4-8e6c-2facea965d3a --functions-grpc-max-message-length 2147483647
root       415    14  0 23:05 ?        00:00:00 sleep 10
root       417    39  0 23:05 ?        00:00:00 sleep 10
app        420   251  0 23:05 ?        00:00:00 /bin/ps -ef

python --version
Python 3.9.19

pip3 --version
pip 23.0.1 from /usr/local/lib/python3.9/site-packages/pip (python 3.9)


uname -a
Linux SandboxHost-638586683115116529 5.10.102.2-microsoft-standard #1 SMP Mon Mar 7 17:36:34 UTC 2022 x86_64 GNU/Linux

### Issues

1. 7.4 PS core is failing
2. Docker based azure function is not available in basic tiers
3. MSI_ENDPOINT is different on azure function (probably also on webapp) than on VM
   1. https://learn.microsoft.com/en-us/azure/app-service/overview-managed-identity?tabs=portal%2Cpython#obtain-tokens-for-azure-resources
      1. client_id needs to provided when user assigned identity is used
   2. https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/how-to-use-vm-token
4. core tools only for x64 linux, and packaged only for debian
5. debian 11
6. function runs in a container as nonroot/nonsudo user
7. Timeout 230s - 4 mins
   1. https://learn.microsoft.com/en-us/azure/azure-functions/functions-scale#timeout
8. 2vcpus, 2gb RAM
9. `az login --identity` uses accesstoken underneath but it's not available as standalone option
   1.  https://github.com/Azure/azure-cli/issues/28484
   2.  https://github.com/Azure/azure-cli/blob/7748d5066e2feecde225a27aac03a438733baf71/src/azure-cli-core/azure/cli/core/auth/util.py#L170
   3.  https://github.com/Azure/azure-cli/blob/7748d5066e2feecde225a27aac03a438733baf71/src/azure-cli-core/azure/cli/core/_profile.py#L727
10. When MSI_ENDPOINT is defined then credentials AccessToken from MSI endpoint is catched by POST request, not GET
    1.  https://github.com/Azure/azure-cli/blob/dev/src/azure-cli-core/azure/cli/core/auth/adal_authentication.py
    2.  https://github.com/Azure/azure-cli/blob/dev/src/azure-cli-core/azure/cli/core/auth/msal_authentication.py
    3.  https://github.com/Azure/azure-cli/blob/dev/src/azure-cli-core/azure/cli/core/_profile.py
    4.  https://github.com/Azure/msrestazure-for-python/blob/master/msrestazure/azure_active_directory.py#L484C9-L484C88


https://github.com/antstanley/msilocal/blob/master/src/fetchToken.js

pip3 install --no-dependencies azure-cli && pip3 install azure-cli-core azure-common azure-mgmt-resource

.local/lib/python3.10/site-packages/msrestazure/azure_active_directory.py
    def _retrieve_token_from_imds_with_retry(self, resource):
        import random
        import json
        # 169.254.169.254 is a well known ip address hosting the web service that provides the Azure IMDS metadata
        request_uri = 'http://169.254.169.254/metadata/identity/oauth2/token'


cat output | cut -c2- | tr '=' ': ' | tr ';' ',' | jq -n

export MSI_ENDPOINT=http://127.0.0.1:8080/metadata/identity/oauth2/token
