import QtQuick 2.4
import GraphQL 1.0

QtObject {
    id: root

    property bool onCall: false
    property bool showKeypadOnCall: false

    property string activeFirstName
    property string activeLastName
    property string activePhoneNumber

    property ListModel buttonModel: ListModel {
        id: buttonModel
        ListElement { name: "End";
            icon: "../assets/ic-end-call.png";
            buttonColor: "red"
        }
        ListElement { name: "Mute";
            icon: "../assets/ic-mute-ongoing.png";
            buttonColor: "transparent"
        }
        ListElement { name: "Keypad";
            icon: "../assets/ic-keypad.png";
            buttonColor: "transparent"
        }
        ListElement { name: "Add Call";
            icon: "../assets/ic-call-contrast.png";
            buttonColor: "transparent"
        }
    }

    property GraphQLQuery client: GraphQLQuery {
        id: query
        query: 'contactPage (offset:0, limit:50) { entries { firstName lastName phone } }'
        isActive: true

        onResultChanged: {
            contactsModel.source = result.contactPage.entries

            // Temporary feeding data
            for (var i = 0; i < contactsModel.count; i++) {
                var person = contactsModel.get(i);
                if (i % 2 !== 0 && i < 10) {
                    favoritesModel.append(person);
                }
            }

            for (var j = 0; j < contactsModel.count; j++) {
                var person2 = contactsModel.get(j);
                if (j % 2 === 0 && j < 8) {
                    voiceMailModel.append(person2);
                }
            }
        }
    }

    property GraphQLModel contactsModel: GraphQLModel {
        id: contactsModel
        fields: ["firstName", "lastName", "phone"]
    }

    property ListModel favoritesModel: ListModel {
    }

    property ListModel recentCallsModel: ListModel {
    }

    property ListModel voiceMailModel: ListModel {
    }

    function call(index, phone) {
        for (var i = 0; i < contactsModel.count; i++) {
            var person = contactsModel.get(i);
            if (person.phone === phone) {
                root.activeFirstName = person.firstName
                root.activeLastName = person.lastName
                root.activePhoneNumber = person.phone
                recentCallsModel.append(person)
                root.onCall = true;
                break;
            }
        }
    }

    function numberCall(number) {
        root.activeFirstName = "unknown"
        root.activeLastName = ""
        root.activePhoneNumber = number
        root.onCall = true;
    }

    function dropCall() {
        root.onCall = false;
    }

    function muteCall() {
        console.log("please implement mute call")
    }

    function showKeypad() {
        root.showKeypadOnCall = true;
    }
}
