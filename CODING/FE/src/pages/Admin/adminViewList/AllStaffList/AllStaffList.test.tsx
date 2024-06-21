import { BrowserRouter } from "react-router-dom";
import ListDentist from "./ListDentist/ListDentist";
import { render, waitFor, screen } from "@testing-library/react";
import { API_ENDPOINTS } from "@/utils/api";
import { get } from "@/utils/apiCaller";

jest.mock("@/utils/apiCaller", () => ({
    get: jest.fn(),
}));

const mockData = {
    list: [
        {
            id: 1,
            firstName: "John",
            lastName: "Doe",
            email: "john.doe@example.com",
            gender: true,
            phone: "123456789",
        },
        {
            id: 2,
            firstName: "Jane",
            lastName: "Smith",
            email: "jane.smith@example.com",
            gender: false,
            phone: "987654321",
        },
    ],
    total: 2,
};

describe("AdminAllStaffList Component", () => {
    beforeEach(() => {
        (get as jest.Mock).mockResolvedValue({
            statusCode: 200,
            success: true,
            message: "Success",
            data: mockData,
        });
        render(
            <BrowserRouter>
                <ListDentist />
            </BrowserRouter>
        );
    });

    it("should call API and display all staffs", async () => {

        const { findByText } = screen;

        await waitFor(() => {
            expect(get).toHaveBeenCalledWith(API_ENDPOINTS.USERS.LIST_DENTIST);
        });

        // Check if data is displayed correctly on the UI
        await waitFor(() => {
            expect(findByText("John")).toBeInTheDocument();
            expect(findByText("Doe")).toBeInTheDocument();
            expect(findByText("john.doe@example.com")).toBeInTheDocument();
            expect(findByText("Male")).toBeInTheDocument();
            expect(findByText("123456789")).toBeInTheDocument();

            expect(findByText("Jane")).toBeInTheDocument();
            expect(findByText("Smith")).toBeInTheDocument();
            expect(findByText("jane.smith@example.com")).toBeInTheDocument();
            expect(findByText("Female")).toBeInTheDocument();
            expect(findByText("987654321")).toBeInTheDocument();
        });
    });
});
