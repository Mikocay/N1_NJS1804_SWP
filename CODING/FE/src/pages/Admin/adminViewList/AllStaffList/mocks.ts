// mocks.ts
import axios from 'axios';
import MockAdapter from 'axios-mock-adapter';
import { API_ENDPOINTS } from '@/utils/api';

const mock = new MockAdapter(axios);

mock.onGet(API_ENDPOINTS.USERS.LIST_DENTIST).reply(200, {
    statusCode: 200,
    success: true,
    data: {
        list: [
            {
                id: "dbc7f403-65e5-46ea-bcb8-45bfeff3f742",
                firstName: "John",
                lastName: "Doe",
                email: "johndoe@example.com",
                gender: "Male",
                phone: "1234567890",
                // Add other fields as needed
            },
            {
                id: "407aa7b9-f5dc-42e8-9dfb-5b1173cacd2c",
                firstName: "Jane",
                lastName: "Smith",
                email: "janesmith@example.com",
                gender: "Female",
                phone: "0987654321",
                // Add other fields as needed
            },
        ],
        total: 2
    }
});
