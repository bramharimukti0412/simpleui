/****************************************************************************
**
** Copyright (C) 2019 Luxoft Sweden AB
** Contact: https://www.qt.io/licensing/
**
** This file is part of the QtAuto Extra Apps.
**
** $QT_BEGIN_LICENSE:BSD-QTAS$
** Commercial License Usage
** Licensees holding valid commercial Qt Automotive Suite licenses may use
** this file in accordance with the commercial license agreement provided
** with the Software or, alternatively, in accordance with the terms
** contained in a written agreement between you and The Qt Company.  For
** licensing terms and conditions see https://www.qt.io/terms-conditions.
** For further information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
** SPDX-License-Identifier: BSD-3-Clause
**
****************************************************************************/

import QtQuick 2.10
import Example.Automation.simulation 1.0

QtObject {
    property var settings : IviSimulator.findData(IviSimulator.simulationData, "TankValues")
    property bool defaultInitialized: false
    property LoggingCategory qLcTankValues: LoggingCategory {
        name: "example.automation.simulation.tankvaluesbackend"
    }
    property var backend : TankValuesBackend {

        function initialize() {
            console.log(qLcTankValues, "INITIALIZE")
            if (!defaultInitialized) {
                IviSimulator.initializeDefault(settings, backend)
                defaultInitialized = true
            }
            Base.initialize()
        }

        property var timer1: Timer {
            interval: 500
            running: true
            repeat: true
            onTriggered: {
                if (backend.tankValue1 < 100) {
                    backend.tankValue1 = backend.tankValue1 + 1;
                } else {
                    backend.tankValue1 = 0;
                }
            }
        }

        property var timer2: Timer {
            interval: 300
            running: true
            repeat: true
            onTriggered: {
                if (backend.tankValue2 < 100) {
                    backend.tankValue2 = backend.tankValue2 + 1;
                } else {
                    backend.tankValue2 = 0;
                }
            }
        }

        property var timer3: Timer {
            interval: 900
            running: true
            repeat: true
            onTriggered: {
                if (backend.tankValue3 < 100) {
                    backend.tankValue3 = backend.tankValue3 + 1;
                } else {
                    backend.tankValue3 = 0;
                }
            }
        }
    }
}


