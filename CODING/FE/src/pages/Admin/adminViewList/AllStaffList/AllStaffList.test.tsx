import { render, screen, waitFor } from '@testing-library/react';
import { API_ENDPOINTS } from '@/utils/api'; // Import your API endpoint constants
import AllStaffListTable from './AllStaffListTable';
import { BrowserRouter } from 'react-router-dom';

// Mock axiosPrivate
jest.mock('@/config/axios', () => ({
    __esModule: true,
    default: {
        interceptors: {
            request: {
                use: jest.fn(),
                eject: jest.fn(),
            },
            response: {
                use: jest.fn(),
                eject: jest.fn(),
            },
        },
        get: jest.fn(() => Promise.resolve({ // Mock axios get method
            data: {
                success: true,
                data: {
                    list: [
                        { id: 1, firstName: 'John', lastName: 'Doe', email: 'john.doe@example.com', gender: true, phone: '123456789' },
                        { id: 2, firstName: 'Jane', lastName: 'Doe', email: 'jane.doe@example.com', gender: false, phone: '987654321' },
                    ],
                    total: 2,
                },
            },
        })),
    },
}));

describe('AllStaffListTable Component', () => {
    beforeEach(() => {
        jest.clearAllMocks();
        jest.resetModules();
    });

    it('renders table with fetched data', async () => {
        render(
            <BrowserRouter>
                <AllStaffListTable url={API_ENDPOINTS.USERS.LIST_DENTIST} />
            </BrowserRouter>
        );

        // Wait for data to be fetched and rendered
        await waitFor(() => {
            const rows = screen.getAllByRole('row');
            expect(rows.length).toBe(2);
        });
        // Check if data is displayed correctly in the table cells
        const firstNameCells = await screen.findAllByText('John'); // Using regular expression for case-insensitive matching
        expect(firstNameCells).toHaveLength(1);

        const lastNameCells = await screen.findAllByText('Doe'); // Using regular expression for case-insensitive matching
        expect(lastNameCells).toHaveLength(2);

        const emailCells = await screen.findAllByText('john.doe@example.com'); // Using regular expression for case-insensitive matching
        expect(emailCells).toHaveLength(1);

        const genderCells = await screen.findAllByText('Male'); // Using regular expression for case-insensitive matching
        expect(genderCells).toHaveLength(1);

        const phoneCells = await screen.findAllByText('123456789'); // Using regular expression for case-insensitive matching
        expect(phoneCells).toHaveLength(1);
    });
});
