import { fireEvent, render, screen } from "@testing-library/react";
import { BrowserRouter } from "react-router-dom";
import userEvent from "@testing-library/user-event";
import LoginForm from "./LoginForm";

describe("Login Form", () => {
  beforeEach(() => {
    render(
      <BrowserRouter>
        <LoginForm />
      </BrowserRouter>
    );
  });
  it("should display required error when value is blank", async () => {
    // Arrange
    const { getByTestId, findByText } = screen;

    // Act
    fireEvent.click(getByTestId("login"));
    const userErrorMsg = await findByText("Email/phone number is required");
    const passErrorMsg = await findByText("Password is required");
    // Assert
    expect(userErrorMsg).toBeInTheDocument();
    expect(passErrorMsg).toBeInTheDocument();
  });
  it.each([
    { input: "test", expected: "Invalid email/phone number" },
    { input: "test@", expected: "Invalid email/phone number" },
    { input: "test@test", expected: "Invalid email/phone number" },
    { input: "test@test.", expected: "Invalid email/phone number" },
    { input: "test@test.c", expected: "Invalid email/phone number" },
    { input: "0762abc", expected: "Invalid email/phone number" },
    { input: "076212322", expected: "Invalid email/phone number" },
    { input: "07621234111", expected: "Invalid email/phone number" },
  ])(
    "should display matching error when enter $input to email/phone number field",
    async ({ input, expected }) => {
      // Arrange
      const { getByTestId, findByText } = screen;
      const passInput = "password";

      // Act
      await userEvent.type(getByTestId("user"), input);
      await userEvent.type(getByTestId("password"), passInput);
      fireEvent.click(getByTestId("login"), { name: /Sign in/i });
      const userErrorMsg = await findByText(expected);
      // Assert
      expect(userErrorMsg).toBeInTheDocument();
      expect(getByTestId("user")).toHaveValue(input);
      expect(getByTestId("password")).toHaveValue(passInput);
    }
  );
});
