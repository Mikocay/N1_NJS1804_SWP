import React from 'react';
import { render, fireEvent, waitFor, screen } from '@testing-library/react';
import axios from '@/config/axios';
import { API_ENDPOINTS } from '@/utils/api';
import CreateBranchBody from './CreateBranchBody';

jest.mock('@/config/axios');

describe('CreateBranchBody', () => {
  it('should fetch manager list and render form correctly', async () => {
    const mockManagers = [
      { id: '1', firstName: 'John', lastName: 'Doe' },
      { id: '2', firstName: 'Jane', lastName: 'Smith' },
    ];

    axios.get.mockResolvedValueOnce({ data: { data: { list: mockManagers } } });

    render(<CreateBranchBody />);

    await waitFor(() => {
      expect(screen.getByLabelText('Branch ID')).toBeInTheDocument();
      expect(screen.getByLabelText('Branch Name')).toBeInTheDocument();
      expect(screen.getByLabelText('Manager')).toBeInTheDocument();
      expect(screen.getByLabelText('Branch Address')).toBeInTheDocument();
      expect(screen.getByLabelText('Branch Mobile')).toBeInTheDocument();
      expect(screen.getByLabelText('Branch Mail')).toBeInTheDocument();
      expect(screen.getByText('Create')).toBeInTheDocument();
    });

    expect(axios.get).toHaveBeenCalledWith(API_ENDPOINTS.USERS.AVAILABLE_MANAGER);
  });

  it('should submit the form correctly', async () => {
    const mockManagers = [
      { id: '1', firstName: 'John', lastName: 'Doe' },
      { id: '2', firstName: 'Jane', lastName: 'Smith' },
    ];

    axios.get.mockResolvedValueOnce({ data: { data: { list: mockManagers } } });
    axios.post.mockResolvedValueOnce({ data: { success: true } });

    const { getByLabelText, getByText } = render(<CreateBranchBody />);

    await waitFor(() => {
      fireEvent.change(getByLabelText('Branch ID'), { target: { value: '123' } });
      fireEvent.change(getByLabelText('Branch Name'), { target: { value: 'Test Branch' } });
      fireEvent.change(getByLabelText('Manager'), { target: { value: '1' } });
      fireEvent.change(getByLabelText('Branch Address'), { target: { value: '123 Main St' } });
      fireEvent.change(getByLabelText('Branch Mobile'), { target: { value: '555-1234' } });
      fireEvent.change(getByLabelText('Branch Mail'), { target: { value: 'test@example.com' } });
    });

    fireEvent.click(getByText('Create'));

    await waitFor(() => {
      expect(axios.post).toHaveBeenCalledWith(API_ENDPOINTS.BRANCHES.CREATE, {
        id: '123',
        name: 'Test Branch',
        mngId: '1',
        address: '123 Main St',
        phone: '555-1234',
        email: 'test@example.com',
      });
    });
  });
});
