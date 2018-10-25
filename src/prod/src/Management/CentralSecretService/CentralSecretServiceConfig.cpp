// ------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All rights reserved.
// Licensed under the MIT License (MIT). See License.txt in the repo root for license information.
// ------------------------------------------------------------

#include "stdafx.h"

using namespace Common;
using namespace Management::CentralSecretService;

DEFINE_SINGLETON_COMPONENT_CONFIG(CentralSecretServiceConfig)

bool CentralSecretServiceConfig::IsCentralSecretServiceConfigured()
{
    return (GetConfig().TargetReplicaSetSize > 0);
}
